<!--- See  
extends="_base" and
encrypted="true" --->

<cfcomponent persistent="true" extends="_base">
	<cfproperty name="id" fieldtype="id" generator="native">
	<cfproperty name="firstname" encrypted="true">
	<cfproperty name="surname">
	<cfproperty name="email">
	<cfproperty name="password">
	<cfproperty name="reset_password">
	<cfproperty name="user_status">
	<cfproperty name="date_added">


	<!--- Custom functions :: Return full name --->
	<cffunction name="getFullName" returntype="string">
		<cfreturn getfirstname() & " " & getsurname()>
	</cffunction>

</cfcomponent>