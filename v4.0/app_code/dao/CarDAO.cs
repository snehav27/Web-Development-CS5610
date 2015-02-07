using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml;
using System.Net;
using System.IO;
using edu.neu.ccis.rasala;
/// <summary>
/// Summary description for CarDAO
/// </summary>
public class CarDAO
{
    static String connstring = ConfigurationManager.ConnectionStrings["ProductionSQLConnectionString"].ConnectionString;

    public CarDAO(string username, string password)
    {


    }

	public CarDAO()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public String checkLoginUser(Car car)
    {
        SqlConnection con = new SqlConnection(connstring);
        

        String sql = "select * from dbo.Login where username = @username and password = @password";

        SqlCommand command = new SqlCommand(sql,con);
        SqlParameter usernameParam = new SqlParameter("@username",car.username);
        SqlParameter passwordParam = new SqlParameter("@password", car.password);


            con.Open();
            command.Parameters.Add(usernameParam);
            command.Parameters.Add(passwordParam);
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {

                String username = reader["username"].ToString();
                String password = reader["password"].ToString();
                Car carnew = new Car(username, password,"","","","","");
                con.Close();
                return username;
            }
            else {
                con.Close();
                return null;
            }

       
       
        
      
    }

    public String changePassword(Car car) {

        String returnValidation = checkLoginUser(car);
        if (returnValidation == null) {
            return "Password Entered is wrong, Please retype again";
        }
        else { 

        SqlConnection con = new SqlConnection(connstring);


        String sql = "update dbo.Login Set password = @password where username = @username";

        SqlCommand command = new SqlCommand(sql, con);
        SqlParameter usernameParam = new SqlParameter("@username", car.username);
        SqlParameter passwordParam = new SqlParameter("@password", car.newPassword);


        con.Open();
        command.Parameters.Add(usernameParam);
        command.Parameters.Add(passwordParam);
        command.ExecuteNonQuery();
        command.Dispose();
        con.Close();
        return "success";
     
    }
    }



    public Car fetchUserInfo(Car car)
    {
        SqlConnection con = new SqlConnection(connstring);


        String sql = "select * from dbo.Login where username = @username";

        SqlCommand command = new SqlCommand(sql, con);
        SqlParameter usernameParam = new SqlParameter("@username", car.username);
        
        con.Open();
        command.Parameters.Add(usernameParam);        
        SqlDataReader reader = command.ExecuteReader();
        if (reader.Read())
        {

            String username = reader["username"].ToString();
            String password = reader["password"].ToString();

            String firstName = reader["firstName"].ToString();
            String lastName = reader["lastName"].ToString();

            String email = reader["email"].ToString();
            String dob = reader["DateOfBirth"].ToString();
            Car carnew = new Car(username, password, "",firstName, lastName, email, dob);
            con.Close();
            return carnew;
        }
        else
        {
            con.Close();
            return null;
        }





    }



    public String UpdateUserInfo(Car car)
    {



        SqlConnection con = new SqlConnection(connstring);


        String sql = "update dbo.Login Set firstName =@firstname, lastName =@lastname, email =@email where username =@username";
      //  String sql = "update dbo.Login Set firstName =@firstname where username =@username";
        SqlCommand command = new SqlCommand(sql, con);

        SqlParameter firstnameParam = new SqlParameter("@firstname", car.firstname);
        SqlParameter lastnameParam = new SqlParameter("@lastname", car.lastname);
         SqlParameter emailParam = new SqlParameter("@email", car.email);
        SqlParameter usernameParam = new SqlParameter("@username", car.username);

        try
        {

            con.Open();

            command.Parameters.Add(firstnameParam);
            command.Parameters.Add(lastnameParam);
            command.Parameters.Add(emailParam);
            command.Parameters.Add(usernameParam);
            command.ExecuteNonQuery();
            command.Dispose();
            return "success";

        }
        catch (Exception err)
        {

            return err.Message;
        }
        finally
        {
            con.Close();
        }



    }



}