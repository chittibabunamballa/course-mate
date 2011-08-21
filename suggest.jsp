<%@ page import="java.util.*,java.io.*,cm.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<title>Coursemate</title>
<style type="text/css">
.center
{
text-align:center;
margin-left:auto;
margin-right:auto;
}
ul
{
list-style-position:inside;
}
</style>

</head>

<body>
<div class="center">
<h1>Course-Mate</h1>
<h3>Course suggestions for you</h3>
<ul>
<%
String srcFolder=application.getRealPath("/WEB-INF/data/");
Split sp=new Split();
String []dataset=sp.SplitByLine(srcFolder+"\\dataset.txt");
ArrayList<String[]>courses=sp.SplitBySubject(srcFolder+"\\courses.txt");
//		for(String str[]:courses)
//			out.write("<option>"+str[0]+"</option>");
String []currentCourses=new String[courses.size()];
for(int i=0;i<courses.size();i++)
	currentCourses[i]=courses.get(i)[0];
String takenCourses[]=request.getParameterValues("takencourses");
ClassMateDriver cmd=new ClassMateDriver();
String suggestions[]=cmd.getSuggestions(takenCourses,currentCourses,false,dataset);
for(String str:suggestions)
if(str!=null)out.write("<li>"+str+"</li>");
/*
out.write("<h1>current courses</h1>");
for(String s:currentCourses)
out.write(s+"<br />");
out.write("<h1>taken courses</h1>");
for(String s:takenCourses)
out.write(s+"<br />");
out.write("<h1>dataset</h1>");
for(String s:dataset)
out.write(s+"<br />");
*/
/*
Map<String,String[]> param=request.getParameterMap();
Set<Map.Entry<String,String[]>> pairs=param.entrySet();

for(Iterator<Map.Entry<String,String[]>> itr=pairs.iterator();itr.hasNext();  )
{
Map.Entry<String,String[]> tmp=itr.next();
out.write("key="+tmp.getKey()+" value=");
for(String s: tmp.getValue())
if(s!=null)out.write(s);
out.write("<br />");
}
*/
/*
FileOutputStream fos=new FileOutputStream("cur");
ObjectOutputStream oos=new ObjectOutputStream(fos);
oos.writeObject(currentCourses);
oos.close();
fos.close();
 fos=new FileOutputStream("tak");
 oos=new ObjectOutputStream(fos);
oos.writeObject(takenCourses);
oos.close();
fos.close();
fos=new FileOutputStream("dataset");
 oos=new ObjectOutputStream(fos);
oos.writeObject(dataset);
oos.close();
fos.close();
*/
%>
</ul>
</div>
</body>

</html>