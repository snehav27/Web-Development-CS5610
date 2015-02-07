using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for GoGreen
/// </summary>
public class GoGreen
{
	public GoGreen()
	{
		//
		// TODO: Add constructor logic here
		//
	}
     public string score { set; get; }
    public string carname { set; get; }
    public string year { set; get; }
    public string cityappendwhere { set; get; }
    public string highappendwhere { set; get; }
    public string cmbappendwhere { set; get; }
    public Boolean greenScore { set; get; }
    public Boolean airPolutionScore { set; get; }
    public GoGreen(string score, Boolean greenScore, Boolean airPolutionScore)
    {

        this.score = score;
        this.greenScore = greenScore;
        this.airPolutionScore = airPolutionScore;
    }
      
    public GoGreen(string carname, string year)
	{

        this.carname = carname;
        this.year = year;
	}
    public GoGreen(string cityappendwhere, string highappendwhere, string cmbappendwhere)
    {
        this.cityappendwhere = cityappendwhere;
        this.highappendwhere = highappendwhere;
        this.cmbappendwhere = cmbappendwhere;
    }
}