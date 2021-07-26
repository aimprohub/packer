from flask import Flask,render_template, request
from flask_mysqldb import MySQL
 
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'packer'
 
mysql = MySQL(app)
 
@app.route('/enq_insert')
def enq_insert():
    return render_template('enq_insert.html')

@app.route('/enq_add')
def enq_add():
    return render_template('theam_enqadd1.html')

 
@app.route('/addrecord', methods = ['POST', 'GET'])
def addrecord():
    
    if request.method == 'GET':
       return "Login via the login Form"
     
    if request.method == 'POST':    
        mode1 = request.form['modee']
        enqdate = request.form['enqdate']
        #print ("Date= "+enqdate)
        #enqdate="2021-03-11"
        name= request.form['name']
        Mob_No = request.form['MobileNo']
        emailid = request.form['email_id']
        tenta_date = request.form['tdate']
        address_load = request.form['add_load']
        address_unload = request.form['add_unload']    
        floor_No_load = request.form['floor_no_load']
        floor_No_unload = request.form['floor_no_unload']
        lift_avail_load = request.form['lift_avail_load']  
        lift_avail_unload = request.form['lift_avail_unload']  
        visit_req = request.form['visit_req']
         
        cursor = mysql.connection.cursor()

        #cursor.execute( "insert into enquiry (enquiry_mode, name, mobile_no, email_id ) values ('inperson', Shastri Sawan', '9887966507','sawan@gmail.com');")
     
        cursor.execute("INSERT INTO enquiry (enquiry_mode, enq_date, name, mobile_no, email_id) VALUES (%s, %s,%s, %s,%s)", (mode1, enqdate, name, Mob_No, emailid ))
        mysql.connection.commit()
        cursor.close()
        return "Done!!"

@app.route('/enqshow')
def enqshow():
    
    cursor = mysql.connection.cursor()
    cursor.execute("SELECT * FROM enquiry1")
    data = cursor.fetchall()
    return render_template('theam_enqshow.html', data=data)


@app.route('/editrec')
def editrec():
    rid = request.args.get('recid')
    print (rid)
    cursor = mysql.connection.cursor()
    #cursor.execute("SELECT * FROM enquiry where enquiry_id = 1")
    cursor.execute ("select * from enquiry where enquiry_id = %s", (rid))
    data = cursor.fetchall()
    return render_template('editrec.html', data=data)

@app.route('/update_record', methods = ['POST', 'GET'])
def update_record():
    
    if request.method == 'GET':
        return "Login via the login Form"
     
    if request.method == 'POST':
        enquiry_id = request.form['enquiry_id']
         
        mode1 = request.form['modee']
        
        enqdate = request.form['enqdate']
        
        name= request.form['name']
        
        Mob_No = request.form['MobileNo']
        
        emailid = request.form['email_id']
        tenta_date = request.form['tdate']
        
        address_load = request.form['add_load']        
        address_unload = request.form['add_unload']
        
        floor_no_load = request.form['floor_no_load']
        floor_no_unload = request.form['floor_no_unload']
        
        lift_available_load = request.form['lift_avail_load']
        lift_available_unload = request.form['lift_avail_unload']
        if lift_available_load == 'y':
            lift_available_load=1
        else:
            lift_available_load=0
        if lift_available_unload == 'y':
            lift_available_unload=0
        else:
            lift_available_unload=0
        print ("after else")
        visit_req = request.form['visit_required']
        house_area_load = request.form['house_size_load']   
        house_area_unload = request.form['house_size_unload']    
        #inv_req = request.form['inv_req'] 
        #print (enquiry_id )
        recid=1
        #enquiry_id =1  
        cursor = mysql.connection.cursor()
          
        #cursor.execute("update enquiry SET enquiry_mode=%s, mobile_no=%s, email_id=%s,floor_no_load=%s,floor_no_unload=%s WHERE enquiry_id=2", ('sms', 5665116677, 'aed@gmail.com', 5, 3 )) 
        
        sql = "UPDATE enquiry SET mobile_no=%s, email_id=%s, floor_no_load=%s,floor_no_unload=%s WHERE enquiry_id=%s"
        val = (Mob_No, emailid, floor_no_load, floor_no_unload, enquiry_id)
        cursor.execute(sql, val)
        sql = "UPDATE enquiry SET lift_available_load=%s, lift_available_unload=%s, address_load=%s,address_unload=%s WHERE enquiry_id=%s"
        val = (lift_available_load, lift_available_unload, address_load, address_unload, enquiry_id)
        cursor.execute(sql, val)
        #cursor.execute("update enquiry SET floor_no_unload=5, mobile_no=3344556677  WHERE enquiry_id=2") 
        mysql.connection.commit()
        cursor.close()
        return "Done!!"

@app.route('/visit')
def list_item():
    cursor = mysql.connection.cursor()    
    cursor.execute ("select * from visit_customer")
    data = cursor.fetchall()
    return render_template('list_visits.html', data=data)  

@app.route('/schedule')
def schedule():
    rid = request.args.get('recid')
    print (rid)
    cursor = mysql.connection.cursor()
    #cursor.execute("SELECT * FROM enquiry where enquiry_id = 1")
    cursor.execute ("select * from enquiry where enquiry_id = %s", (rid))
    data = cursor.fetchall()
    return render_template('schedule.html', data=data)

#app.run(host='localhost', port=5000)
if __name__ == '__main__':
   app.run(debug = True)