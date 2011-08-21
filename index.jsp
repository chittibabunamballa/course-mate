<%@page import="java.io.*,java.util.*,cm.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Coursemate</title>
<style type="text/css">
select.multi
{
height:400px;
width:300px;
}
.bold{font-weight:bold;}
</style>

</head>

<body>

<form id="form1" name="form1" method="post" action="suggest.jsp">
  <h1 align="center">Course-Mate</h1>
  <h1 align="center">
    <span class="style1">
    <label></label>
  </span></h1>
  <table width="500" border="0" align="center">
    <tr>
      <td width="244"><div align="right" class="bold">Current Semester :</div></td>
      <td width="246"><select name="current_sem" size="1" id="current_sem" style="width:100px;text-align:center;margin-left: auto;margin-right: auto;">
        <option value="3" selected="selected">III</option>
        <option value="4">IV</option>
        <option value="5">V</option>
        <option value="6">VI</option>
        <option value="7">VII</option>
        <option value="8">VIII</option>
      </select>
      </td>
    </tr>
  <!--  <tr>
      <td><div align="right">Current CPI :</div></td>
      <td><input type="text" name="curr_cpi" id="curr_cpi" /></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">Consider CPI : 
          <label>
        <input type="radio" name="radio" id="cpi_yes" value="cpi_yes" />
        Yes</label>
        <label>
        <input type="radio" name="radio" id="cpi_no" value="cpi_no" />
        NO</label>
      </div></td>
    </tr> -->
  </table>
  <p>&nbsp;</p>
  <table width="580" border="0" align="center">
    <tr>
      <td width="330" class="bold">All courses :</td>
      <td width="250" class="bold">Courses Previously Taken :</td>
    </tr>
  </table>
  <table width="500" border="0" align="center">
    <tr>
      <td height="158">
      <select id="allcourses" multiple="multiple" class="multi">
      <%
		String srcFolder=application.getRealPath("/WEB-INF/data/");
		//out.write(srcFolder);
		Split s=new Split();
		ArrayList<String[]>courses=s.SplitBySubject(srcFolder+"\\courses.txt");
		for(String str[]:courses)
			out.write("<option>"+str[0]+"</option>");
	  %>
      </select>
      </td>
      <td>
        <input type="button" name="course_add" id="course_add" value="--&gt;" onclick="transferCourses();" />
      
      <p>
        
        <input type="button" name="course_rem" id="course_rem" value="&lt;--" onclick="removeCourses();" />
        
      </p></td>
      <td><select id="takencourses" multiple="multiple" name="takencourses" class="multi">
      
      </select></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="62" border="0" align="center">
    <tr>
      <td width="56"><input type="submit" name="submit" id="submit" value="Submit" /></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p align="center" id="text"><strong></strong></p>
</form>

<script type="text/javascript">

var t=document.getElementById("text");
var acourses=document.getElementById("allcourses");
var tcourses=document.getElementById("takencourses");
//alert(acourses);
//alert(tcourses);
//for(var pro in acourses)
//	t.innerHTML+=pro+"<br/>";
//alert(allcourses.selectedIndex);

function transferCourses() {
  //  alert(tcourses.options.length);
//	alert(acourses.options.length);
    
    while (tcourses.options.length > 0)
        tcourses.options.remove(0);
//    for (var i = 0; i < tcourses.options.length; i++)
//        tcourses.options.remove(i);
    for (var opt = 0; opt < acourses.options.length; opt++) {
        //tcourses.options.removeChild
       
        //alert(opt + " " + tcourses.options.length);
        if (acourses.options[opt].selected == true) {
            var tmp=document.createElement("option");
            tmp.text = acourses.options[opt].text;
            tmp.value = acourses.options[opt].value;
			tmp.selected=true;
			
            //tmp=opt;
            //tcourses.options[tcourses.options.length] = tmp;
            tcourses.options.add(tmp);
            
        }
    }
}

function removeCourses() {
	while (tcourses.options.length > 0)
        tcourses.options.remove(0);
    // for (var opt = 0; opt < tcourses.options.length; opt++) {
        // if (tcourses.options[opt].selected == true) {
            // tcourses.options.remove(opt);
        // }
}
</script>
</body>
</html>
