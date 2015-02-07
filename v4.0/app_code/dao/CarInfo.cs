using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CarInfo
/// </summary>
public class CarInfo
{
    public string carname { set; get; }
    public string year { set; get; }
    public CarInfo(string carname, string year)
	{

        this.carname = carname;
        this.year = year;
	}
}