<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<script language="javascript">
		function doAlert(s) {
		   alert(s);
		}
		function enterNums(){
			var numA = prompt('Enter number \'a\' greater than or equal to zero:','0');
            var numB = prompt('Enter number \'b\' (should be greater than number \'a\') :','2');
        	
            // set applet's public variable
            mathApplet.userName = "John Doe";

            // invoke public applet method
            var greeting = mathApplet.getGreeting();

            // get another class referenced by applet and invoke its methods
            var calculator = mathApplet.getCalculator();
            calculator.setNums(numA, numB);

            // primitive datatype returned by applet
            var sum = calculator.add();

            // array returned by applet
            var numRange = calculator.getNumInRange();
            var numRangeStr = arrayToString(numRange);

            // check Java console log for this message
            mathApplet.printOut("Testing printing to System.out");

            // get another class, set static field and invoke its methods
            var dateHelper = mathApplet.getDateHelper();
            dateHelper.label = "Today\'s date is: ";
            var dateStr = dateHelper.getDate();

            document.writeln("<p>Results of JavaScript to Java Communication</p>");
            document.writeln("<p>" + greeting + "</p>");
            document.writeln("<p> a = " + numA + " ; b = " + numB + " </p>");
            document.writeln("<p>Sum: " + sum + "</p>");
            document.writeln("<p>Numbers in range array: " + numRangeStr + "</p>");
            document.writeln("<p>" + dateStr + "</p>");

		}


        function arrayToString(arr) {
            var ret = "[ ";
            for (i = 0; i < arr.length; i++) {
                if (i > 0) {
                    ret += ", ";
                }
                ret += arr[i];
            }
            ret += " ]";
            return ret;
        }
        
        function scannerConnectionError(error) {
    		document.getElementById("scan-error").innerHTML = error;
    	}
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>
	<applet alt = "Dynamic Tree Applet Demo" code = 'appletComponentArch/DynamicTreeApplet.class' archive = '/test/resources/DynamicTreeDemo.jar' 
        width = 300
        height = 300 >
      <param name="permissions" value="sandbox">
    </applet>
    <!-- <applet alt = "Dynamic Tree Applet Demo" name="mathApplet" code = 'jstojava/MathApplet.class' archive = '/test/resources/applet_InvokingAppletMethodsFromJavaScript.jar' 
        width = 300
        height = 300 >
      <param name="permissions" value="sandbox">
    </applet>  -->
    <object  width = 300 height = 300 name="mathApplet" height = 300 classid="clsid:CAFEEFAC-0017-0000-FFFF-ABCDEFFEDCBA">
		<param name="archive" value="/test/resources/applet_InvokingAppletMethodsFromJavaScript.jar">
  		<param name="code" value="jstojava/MathApplet.class">
    	<comment>
      		<embed width=300 height = 300  name="mathApplet" type="application/x-java-applet;version=1.7">
				<param value="/test/resources/applet_InvokingAppletMethodsFromJavaScript.jar" name="archive">
	      		<param value="jstojava/MathApplet.class" name="code">
				<param value="." name="codebase">
		       	<noembed>
		          No Java Support.
		        </noembed>
		    </embed>
	    </comment>
  	</object>
    <div id="scan-error">testing</div>
    <p><a href="javascript:enterNums();">Launch Example</a></p>
</body>
</html>
