<cfcomponent output="false">

	<cfset THIS.name = hash( getCurrentTemplatePath() & CGI.HTTP_HOST ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.SessionTimeout = CreateTimeSpan(0,2,0,0) />
	<!--- Set to 1 second while testing CLIENT variables authentication functionality --->
	<!--- <cfset THIS.SessionTimeout = CreateTimeSpan(0,0,0,1) /> --->
	<cfset THIS.clientManagement = true>

	<cfset THIS.datasource = "cipci"/>
	<cfset THIS.ormEnabled = true />
	<cfset THIS.ormsettings.cfclocation = "application/ORM" />
	<cfset THIS.ormsettings.eventHandling = true />
	<cfset THIS.invokeImplicitAccessor = true>

	<cfset request.db_key = 'QPet5vFnC7+ep6S/RW5k4KvlyybcXWgs'>

	<cfset THIS.setDomainCookies = false />


	<!--- Layout manager --->
	<cffunction name="OnRequestStart" returntype="boolean" output="true">
		<cfargument
			name="template"
			type="string"
			required="true"
			hint="I am the template requested by the user."
			/>

		<!--- If reload is called or application is in full reload mode then run onApplicationStart to reload all singletons --->
    	<cfif structKeyExists(url, "APPReload") OR structKeyExists(url, "ar")>
            <!--- Create an exclusive lock to make this call thread safe --->
            <cflock name="reloadApp" timeout="60" type="exclusive">

				<!--- Reload the app --->
				<cfset ORMReload()>
			</cflock>
		</cfif>

		<cfreturn true>
	</cffunction>



</cfcomponent>