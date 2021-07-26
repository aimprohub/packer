import os
import MySQLdb
from datetime import datetime, timedelta
#import datetime
from flask import Flask, render_template, request, url_for, redirect, session
from flask_mysqldb import MySQL
import re
  #-- instead imported datetiem. That worked to get tomarrow date
 
app = Flask(__name__)

app.secret_key = 'your secret key'

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
#app.config['MYSQL_HOST'] = 'aim.cvot3mbu0m9d.us-east-2.rds.amazonaws.com'
#app.config['MYSQL_USER'] = 'gismaster'
# app.config['MYSQL_PASSWORD'] = 'first#1234'

app.config['MYSQL_DB'] = 'packer'
mysql = MySQL(app)


@app.route("/")
def index():
    return render_template("index_login.html", message="Hello Flask!")
    # return render_template("try1.html", message="Hello Flask!", contacts = ['c1', 'c2', 'c3', 'c4', 'c5']);


# All ablut login and session. Takenfrom other site.
@app.route('/login')
@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor = mysql.connection.cursor()
        cursor.execute(
            'SELECT * FROM accounts WHERE username = % s AND password = % s and active=True', (username, password, ))
        account = cursor.fetchone()

        #print ("account=",account)
        if account:
            #print ("accountID=", account[0])
            session['loggedin'] = True
            #session['id'] = account['id']
            session['session_id'] = account[0]
            #session['username'] = account['username']
            session['username'] = account[1]
            session['role'] = account[4]
            msg = 'Logged in successfully ! Session on'
            if session['role'] in ('admin'):
                return render_template('index_admin.html', msg=msg, session_id=session['session_id'], session_username=session['username'], role=session['role'])
            else:
                return render_template('index_login.html', msg=msg, session_id=session['session_id'], session_username=session['username'], role=session['role'])
        else:
            msg = 'Incorrect username / password !'
    return render_template('login_login.html', msg=msg)


@app.route('/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('session_id', None)
    session.pop('username', None)
    # return redirect(url_for('/login'))
    return render_template('login_login.html')


@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        role = request.form['role']
        role = role.lower()
        #cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor = mysql.connection.cursor()
        cursor.execute(
            'SELECT * FROM accounts WHERE username = % s', (username, ))
        account = cursor.fetchone()
        if account:
            msg = 'Account already exists !'
        elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
            msg = 'Invalid email address !'
        elif not re.match(r'[A-Za-z0-9]+', username):
            msg = 'Username must contain only characters and numbers !'
        elif not username or not password or not email:
            msg = 'Please fill out the form !'
        else:
            cursor.execute('INSERT INTO accounts (username, password, email, role, active) VALUES (% s, % s, % s, % s, 1)',
                           (username, password, email, role))
            mysql.connection.commit()
            msg = 'User successfully registered !'
    elif request.method == 'POST':
        msg = 'Please fill out the form !'
    return render_template('register.html', msg=msg)


@app.route('/disp_table', methods=['GET', 'POST'])
def disp_table():
    cursor = mysql.connection.cursor()
    insert_but=""                        #When disp_list called directly there is no value to insert_but (gives error)
    insert_but=request.form.get('insert')
    if not insert_but :
        insert_but="a"                   #This is dummy value. To ensure routing, if not calling from 'insert' button selection. 
    print("but selected", insert_but)
    #cursor.execute("SELECT * FROM enquiry1")
    #cursor.execute("select enquiry1.*, memo.visit_no_id from enquiry1 left join memo ON enquiry1.enquiry_no_id = memo.enquiry_no_id;")
    cursor.execute("select enquiry1.*, visit.visit_no_id from enquiry1 left join visit ON enquiry1.enquiry_no_id = visit.enquiry_no_id;")
    data = cursor.fetchall()
    if "Material" in insert_but :
        #memo_list()
        cursor.execute('select material_name,stock_UM from material')
        material_data = cursor.fetchall()    
        return render_template('memo_mat_list.html', material_data=material_data)

    cursor.execute("SELECT enquiry_no_id, memo_date FROM memo")
    memo_data = cursor.fetchall()
    for row in memo_data:
        enquiry_no_id = row[0]
        memo_date = row[1]

    return render_template('disp_table.html', data=data, memo_date=memo_data)

def memo_list(): 
    print("in memo list")
    #return render_template('disp_table.html', data=data, memo_date=memo_data)
    
@app.route('/material_select', methods=['GET', 'POST'])
def material_select():
    cursor = mysql.connection.cursor()
    enq_id = request.form.get('enq_number')
    insert_but=""                        #When disp_list called directly there is no value to insert_but (gives error)
    insert_but=request.form.get('insert')
    if not insert_but :
        insert_but="a"                   #This is dummy value. To ensure routing, if not calling from 'insert' button selection. 
    print("but selected:", insert_but, ",",enq_id)
    #data = cursor.fetchall()
    if "Material" in insert_but :
        #memo_list()
        cursor.execute('select material_name,stock_UM from material')
        material_data = cursor.fetchall()
        enq_id = request.form.get('enq_number')    
        return render_template('memo_mat_list.html', material_data=material_data, enq_id=enq_id)

@app.route('/material_issued', methods=['GET', 'POST'])
def material_issued():
    cursor = mysql.connection.cursor()
    enq_id = request.form.get('enq_number')
    #qty_issued=request.form.get('qty_issued') 
    insert=request.form.get('insert')
    #insert=request.form['insert']
    qty_issued="QTY"
    print("AAA:",enq_id,insert,qty_issued)
    return("Values are=",qty_issued)   

@app.route('/page1/<my_var>')
def page1(my_var):
    # but_id = str(request.form['myBut'])
    # my_var = request.args.get('my_var', None)
    print(request.form.get('my_var'))
    print(my_var)
    return render_template("page1.html", my_var=my_var)
    print("but_id=", but_id)
    #but_id = str(request.args.get('myBut'))
    return but_id


@app.route('/disp_table1', methods=['GET', 'POST'])
def disp_table1():
    # but_id = str(request.form['myBut'])
    #recid = request.args.get('recid')
    #recid = str(recid)
    #print(request.form.get('recid'))
    cursor = mysql.connection.cursor()
    party_name = str(request.form.get('party_name'))
    contact_no=request.form.get('contact_no')
    email_id=request.form.get('email_id')
    address_from=request.form.get('address_from')
    address_to=request.form.get('address_to')
    t_moving_date=str(request.form.get('t_moving_date'))
    #t_moving_date='2021-03-10'
    city_load=request.form.get('city_load')
    city_unload=request.form.get('city_uload')
    house_area = request.form.get('house_area')
    p_visit_date=str(request.form.get('p_visit_date'))
    floor_no_load=request.form.get('floor_no_load')
    floor_no_unload=request.form.get('floor_no_unload') 
    lift_Ld=request.form.get('lift_Ld')
    lift_Ld=1
    lift_Unld=request.form.get('lift_Unld')
    print("but_id=", house_area, lift_Ld, address_to)
    #today = datetime.today()
    #today1 = today.strftime("%Y-%m-%d")
    timestamp=datetime.now()
    today1 = timestamp.strftime("%Y-%m-%d")
    cursor.execute ( 'INSERT INTO enquiry1 (date_of_enquiry, party_name, party_mobile_no, party_mail_id, tentative_shifting_date, address_loading, city_loading, address_unloading,city_unloading, floor_no_loading, floor_no_unloading, preferred_visit_date, household_size, active )  values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', 
         (today1, party_name, contact_no,email_id, t_moving_date, address_from, city_load, address_to, city_unload, floor_no_load, floor_no_unload, p_visit_date, house_area, 1 ))
  
    #cursor.execute ( 'INSERT INTO enquiry1 (party_name, party_mobile_no,party_mail_id,tentative_shifting_date, address_loading,city_loading, address_unloading, city_unloading, household_size, preferred_visit_date, lift_availability_loading,lift_availability_unloading) values (%s, %s, %s, %s, %s, %s, %s, %s,%s,%s,%s,%s)',(party_name,contact_no,email_id, t_moving_date,address_from,city_load,address_to, city_unload, house_area,p_visit_date,lift_Ld,lift_Unld))
    mysql.connection.commit()
    #return ('Party=' + party_name)
    return render_template('disp_table.html')

@app.route('/enq_visit', methods=['GET', 'POST'])
def enq_visit():
    recid = request.form.get('recid')
    preferred_visit_date = request.form.get('p_visit_date')
    exe_name = request.form.get('exe_name')
    article_list = request.form.get('article')
    cursor = mysql.connection.cursor()
    cursor.execute('INSERT INTO visit (preferred_visit_date, enquiry_no_id, visit_Executor_name, article_list) VALUES (%s, %s, %s, %s)',
                           (preferred_visit_date, recid, exe_name, article_list))
    mysql.connection.commit()
    #return ('Enqiry visit updated ' + recid)
    #return render_template('disp_table.html', recid=recid)
    return redirect(url_for('disp_table'))

@app.route('/page2', methods=['GET', 'POST'])
def page2():
    name = request.form['name']
    age = request.form['age']
    radio = request.form['nameradio']
    but_pressed = request.form['open']
    # Use following (topen) when using submit direclty from  table rows. Refer pagetable.html
    #edit_pressed = request.form['topen']
    print(name, ' ', age, ' ', radio)
    return render_template("page2.html", name=name, age=age, radiovalue=radio, but_pressed=but_pressed)


@app.route('/page')
def page():
    return render_template("postpage.html")


@app.route('/pagetable')
def pagetable():
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM enquiry")
    data = cursor.fetchall()
    return render_template('pagetable.html', data=data)
    # return render_template("pagetable.html")


@app.route('/insert')
def insert():
    #today = datetime.today()
    #nextweek = datetime.date.today()+ datetime.timedelta(days = 9)
    #today = datetime.date.today()
    #today1 = nextweek.strftime("%Y-%m-%d")
    timestamp=datetime.now()
    tommrrow = timestamp + timedelta(5)
    today1 = tommrrow.strftime("%Y-%m-%d")
    return render_template('insert_table.html',today1=today1)


@app.route('/insert_table', methods=['GET', 'POST'])
def insert_table():
    cursor = mysql.connection.cursor()
    name = request.form['name']
    alist = request.form['alist']
    cursor.execute( 'INSERT INTO visit (name, alist, enquiry_no_id ) values (% s, %s, 2)', (name, alist))
    mysql.connection.commit()
    return ('Data in table- success')

@app.route('/open_enq', methods=['GET', 'POST'])
def open_enq():
    timestamp=datetime.now()
    today1 = timestamp.strftime("%Y-%m-%d")
    #today = datetime.today()
    #today1 = today.strftime("%Y-%m-%d")
    cursor = mysql.connection.cursor()
    #recid = request.args.get('enqid_select')
    recid = request.form['enqid_select']
    print ("first recid ", recid, today1)
    
    #cursor.execute( 'INSERT INTO visit (name, alist, enquiry_no_id ) values (% s, %s, 2)', (name, alist))
    #cursor.execute('select * from enquiry1 where enquiry_no_id = %s', (recid))
    cursor.execute('select * from enquiry1 where enquiry_no_id = %s', (recid,))
    data = cursor.fetchall()
    for row in data:
        party_name = row[2]
        address_loading = row[6]
        address_unloading = row[8]
    #print (recid, party_name , address_loading,address_unloading)    
    visit_no = 0
    try :    
        cursor.execute('select visit_no_id from visit where enquiry_no_id = %s', (recid,))
        data_visit = cursor.fetchall()
        for row in data_visit:
            visit_no = row[0]
    except :
        visit_no=0
    print ("after try visit_id ", visit_no, recid)
    submit_selected=request.form['submit']
    #print ('Submit', submit_selected)
    if submit_selected in 'Edit Record':
        return("Edit Record pg to call")
    if submit_selected in 'Open Enquiry':
        return render_template('open_enq.html', data=data, recid=recid)
    if submit_selected in 'Visit':
        cursor.execute('select fname,lname, executive_id from executive')
        executive_names = cursor.fetchall()
        print ('Exe Names ', executive_names )
        return render_template('enq_visit.html', data=data, recid=recid, party_name=party_name, executive_names=executive_names)   
    
    if submit_selected in 'Quotation Form' :
        print ("In quot =", visit_no)
        if visit_no == 0 :
            return("Please complete visit first")

        return render_template('quot_form.html', data=data, recid=recid, party_name=party_name, address_loading=address_loading, address_unloading=address_unloading, visit_no = visit_no, today1=today1 )   
    
    if submit_selected in 'Work Order Memo' :
        try :    
            cursor.execute('select * from memo where enquiry_no_id = %s', (recid,))
            data_enqid = cursor.fetchall()
            print ("in workorder ", recid, len(data_enqid))   # corrected this to start checking that already memo is done.

            memo_data = row
            for row in data_enqid:
                
                enquiry_no_id = row[3]
                print ("enq_id = ", enquiry_no_id, memo_data)
                #return ("Page with work memo values.",enquiry_no_id)
            if not len(data_enqid) is 0 :                     #NOT 0. memo already exists. only show memo
                return render_template('memo_display.html',memo_data=data_enqid, recid=recid) 
            else :                                 # New memo. Collect values
                return render_template('memo_form.html', data=data, recid=recid, party_name=party_name, address_loading=address_loading, address_unloading=address_unloading, visit_no = visit_no, today1=today1 )             
        except :
            print ('In except')

        return render_template('memo_form.html', data=data, recid=recid, party_name=party_name, address_loading=address_loading, address_unloading=address_unloading, visit_no = visit_no, today1=today1 ) 
    else :
        return ("Page yet to design.")

@app.route('/quot_tracker', methods=['GET', 'POST'])
def quot_tracker():
    cursor = mysql.connection.cursor()
    #recid = request.form['enqid_select']
    cursor.execute("SELECT * FROM quotation")
    data = cursor.fetchall()
    return render_template('quot_tracker.html', data=data)
    #return ("Page to display quot list and status.")

@app.route('/memo_success', methods=['GET', 'POST'])
def memo_success():
    cursor = mysql.connection.cursor()
    today = datetime.today()
    d1 = today.strftime("%Y-%m-%d")
    memodate = request.form.get('memodate')   
    consignor= request.form.get('consignor')
    consignorAdd = request.form.get('consignorAdd')
    recid = request.form.get('recid')
    visit_no = request.form.get('visit_no')
    party_name = request.form.get('party_name')
    consignee  = request.form.get('consignee1')
    consigneeAdd  = request.form.get('consigneeAdd')
    driver_name = request.form.get('driver_name')
    driver_allowace = request.form.get('driver_allowace')
    good_desc = request.form.get('good_desc')
    truck_no = request.form.get('truck_no')
    truck_owner = request.form.get('truck_owner')
    labour_name = request.form.get('labour_name')
    labour_charges = request.form.get('labour_charges')
    fright_charges = request.form.get('fright_charges')

    cursor.execute( 'INSERT INTO memo (enquiry_no_id, visit_no_id, memo_date, consignor, consignor_address, consignee, consingnee_address, driver_name, driver_allowance, good_description, truck_no, truck_owner,labour_name, labour_charges, fright_charges ) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)', 
          (recid, visit_no, memodate, consignor, consignorAdd, consignee, consigneeAdd, driver_name, driver_allowace, good_desc, truck_no, truck_owner, labour_name, labour_charges, fright_charges ))
    mysql.connection.commit()
    print ("Enq Id=", recid, memodate,d1, visit_no,party_name, consignor, consignorAdd, consignee, driver_name, driver_allowace,truck_owner,truck_no) 
    return render_template('memo_success.html', recid=recid, visit_no = visit_no, party_name=party_name)
    #return ("Page with work memo save all values")
    
@app.route('/quot_save', methods=['GET', 'POST'])
def quot_save():
    cursor = mysql.connection.cursor()
    
    recid = request.form.get('recid')
    visit_no = request.form.get('visit_no')
    party_name = request.form.get('party_name')
    quot_date = request.form.get('quot_date')
    charges_type = request.form.get('charges_type')
    details = request.form.get('details')
    amount = request.form.get('amount')
    tax = request.form.get('tax')
    cursor.execute( 'INSERT INTO quotation (enquiry_no_id, visit_no_id, quotation_date, charges_type, details, amount, tax ) values (%s, %s, %s, %s, %s, %s, %s)', (recid, visit_no, quot_date, charges_type, details, amount, tax))
    mysql.connection.commit()
    #return ("Quotation saved")
    return redirect(url_for('disp_table'))

# manage user profile: user psw, contant no, email, address, User_id(not editable), active, role
@app.route('/profile', methods=['GET', 'POST'])
def profile():
    msg = ''
    errflg = ''
    if request.method == 'POST' and 'username' in request.form:
        username = request.form['username']
        new_psw = request.form['new_psw']
        rep_new_psw = request.form['rep_new_psw']
        old_psw = request.form['old_psw']
        #cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor = mysql.connection.cursor()
        cursor.execute(
            'SELECT * FROM accounts WHERE username = % s', (username, ))
        account = cursor.fetchone()
        #print("Form contains :",username,old_psw, new_psw, rep_new_psw, account, account[2])
        #print('compare old-psw=',old_psw,' and ',account[2])
        if account:
            msg = 'Account exists !'
            if not re.match(r'[A-Za-z0-9]+', new_psw):
                msg = 'New Password must contain only characters and numbers !'
                errflg = 'error'
            if new_psw != rep_new_psw:
                msg = 'psw and repeat psw should be same !'
                errflg = 'error'
            if old_psw != account[2]:
                print('MSG=', old_psw, account[2])
                msg = 'Incorrect current password'
                errflg = 'error'
            if errflg:
                print("error in form.")
            else:
                print("can insert values of new psw")
                msg = 'Success Change password !'
                # INSERT INTO accounts VALUES (NULL, % s, % s, % s)', (username, password, email, ))
                cursor = mysql.connection.cursor()
                cursor.execute(
                    ('UPDATE accounts set password=%s where id = %s'), (new_psw, account[0]))
                mysql.connection.commit()

        else:
            msg = 'You should have account registered !'
    elif request.method == 'POST':
        msg = 'Please fill out the form !'
    return render_template('changepsw.html', msg=msg)


# Display all vender list in table
@app.route('/select_vender')
def select_vender():
    if 'session_id' in session:
        sessionid = session['session_id']
        session_role = session['role']

        cursor = mysql.connection.cursor()
        cursor.execute("SELECT name, vender_id, address FROM vender")
        data = cursor.fetchall()
        venderid = request.args.get('venderid')
        print("in vender id= ", venderid)
        if session_role == 'admin':
            return render_template('select_vender.html', data=data, venderid=venderid, role=session_role)
        else:
            return render_template('select_vender.html', data=data, venderid=venderid, role=session_role)
    else:
        return '<p>Please login first</p>'


@app.route('/select_dept')
def select_dept():
    if 'session_id' in session:
        sessionid = session['session_id']
        print("in dept sessionid= ", sessionid)
        sel = request.args.get('dept')
        venderid = request.args.get('venderid')
        print("vender =", venderid)
        cursor = mysql.connection.cursor()
        #cursor.execute("SELECT equ_name, equ_parameter_id  FROM equipment")
        cursor.execute("SELECT department_name, department_id FROM department")
        data = cursor.fetchall()
        return render_template('select_dept.html', data=data, deptid=sel, venderid=venderid)
    else:
        return '<p>Please login first</p>'
    #sel = request.args.get('vender')
    #cursor = mysql.connection.cursor()
    #cursor.execute("SELECT department_name, department_id FROM department")
    #data = cursor.fetchall()
    # return render_template('select_dept.html', data=data, venderid=sel)


@app.route('/select_equip')
def select_equip():
    if 'session_id' in session:
        sessionid = session['session_id']
        sel = request.args.get('deptid')
        venderid = request.args.get('venderid')
        print("venderid in eq=", venderid)
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT equ_name, equ_parameter_id  FROM equipment")
        data = cursor.fetchall()
        return render_template('select_equip.html', data=data, deptid=sel, venderid=venderid)
    else:
        return '<p>Please login first</p>'

# get comma seperated record and show in table


@app.route('/hosplist')
def hosplist():
    equipid = request.args.get('equipment')
    print("EQP=", equipid)
    cursor = mysql.connection.cursor()
    cursor.execute(
        "SELECT parameter_name FROM equ_parameter_reg where equ_parameter_id=%s", (equipid,))
    data = cursor.fetchall()
    s = "-"
    for row in data:
        print(row)
        s = s.join(row)
        rowx = s.split(',')

    return render_template('hosplist.html', data=rowx)


@app.route('/parameter_input')
def parameter_input():
    if 'session_id' in session:
        deptid = request.args.get('deptid')
        venderid = request.args.get('venderid')
        equipmentid = request.args.get('equipmentid')
        cursor = mysql.connection.cursor()
        cursor.execute(
            'SELECT equ_name, equ_parameter_id FROM equipment where equ_id =%s', (equipmentid,))
        #equ_name = cursor.fetchone()
        data = cursor.fetchall()
        for row in data:
            equ_name = row[0]
            equ_parameter_id = row[1]

        print('EQUIP=', equ_name, equ_parameter_id)
        cursor.execute(
            "SELECT parameter_name FROM equ_parameter_reg where equ_parameter_id=%s", (equ_parameter_id,))
        data = cursor.fetchall()
        s = "-"
        for row in data:
            print(row)
            s = s.join(row)
            rowx = s.split(',')
            return render_template('parameter_input.html', data=rowx, venderid=venderid, deptid=deptid, equipmentid=equipmentid, equ_name=equ_name)
    else:
        return '<p>Please login first.</p>'


@app.route('/save_reading', methods=['GET', 'POST'])
def save_reading():
    if 'session_id' in session:
        sessionid = session['session_id']
        if request.method == 'POST':
            #equipmentid = request.args.get('equipmentid')
            print(request.form)
            print(request.form.to_dict())
            form_obj = request.form.to_dict()
            equipmentid = request.form['equipmentid']
            form_values = request.form['textall']
            remark = request.form['Remarks']
            approvar_name = request.form['approvar_name']
            approvar_email = request.form['approvar_email']
            try:
                verified1 = request.form['verified']
                varified1 = 0
            except:
                varified1 = 1

            #print ("varified=",verified)
            # if verified != 'on':
            #    verified =0
            #followed = request.form['followed']
            # approvar_email='rajan22@mail.com'

            # Get equ_parameter_id from equipmentid
            cursor = mysql.connection.cursor()
            cursor.execute(
                'SELECT equ_name, equ_parameter_id FROM equipment where equ_id =%s', (equipmentid,))
            data = cursor.fetchall()
            for row in data:
                equ_name = row[0]
                equ_parameter_id = row[1]

            # get parameter_names (list) in array defined from equ_parameter_id
            cursor.execute(
                'SELECT parameter_name FROM equ_parameter_reg where equ_parameter_id =%s', (equ_parameter_id,))
            data = cursor.fetchall()
            for row in data:
                parameter_name = row[0]

            para_name = str(parameter_name)

            # split on | and get a parameter list
            #para_list = form_values.split("|")

            # remove unwanted elements from list
            #del para_list[-8]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[-1]
            #del para_list[2]

            # Again join and get string with | seperated values in string.
            #from_values_m = '|'.join(map(str, para_list))
            timestamp = datetime.now()
            cur_date = timestamp.strftime("%Y-%m-%d")

            # insert all the values along with (coma seperated) data string (parameter_readings in calibrate).
            #cursor.execute('insert  into calibrate (id, equ_id, parameter_readings, perform_date, approvar_name, remark,approvar_email,digitally_signed ) values (%s,%s,%s, %s, %s, %s,%s,%s)', (sessionid,equipmentid,from_values_m,cur_date, approvar_name, remark,approvar_email,verified1,))
            # mysql.connection.commit()
            cursor.execute('insert  into calibrate (id, equ_id, parameter_readings, perform_date ) values (%s,%s,%s, %s)',
                           (sessionid, equipmentid, form_obj, cur_date,))
            mysql.connection.commit()
            #print ('Parameter=', from_values_m,' Name=',para_list,'Inserted OKLEN=',len(para_list))
            # return "para_name ", parameter_name," Name=",parameter_name
            return str(form_values)

    else:
        return '<p>Please login first</p>'


if __name__ == "__main__":
#    app.run(host='192.168.1.200', port=5000, debug=True)
     app.run(host='0.0.0.0', port=5000, debug=True)
