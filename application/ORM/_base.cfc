<!--- 
	This base ORM component will silently encrypt/decrypt any values while they are going in/out of the DB. 
	It just requires that the ORM propery has the attribute encrypted="true".
	See users.cfc > firstname property
--->
<cfcomponent>

	<cffunction name="preInsert" output="false" access="public" returntype="void">
	     <cfset encryptProperties() />
	</cffunction>
	 
	<cffunction name="preUpdate" output="false" access="public" returntype="void">
	     <cfset encryptProperties() />
	</cffunction>
	 
	<cffunction name="postLoad" output="false" access="public" returntype="void">
	     <cfset decryptProperties() />
	</cffunction>


	<cffunction name="encryptProperties" 
	     output="false" 
	     access="public" 
	     returntype="void" >
	 
	     <cfset var props = getMetaData( this ).properties />
	 
	     <cfloop array="#props#" index="prop">
	          <cfif structKeyExists(  prop, "encrypted" ) AND prop.encrypted >
	               <cfset variables[ prop.name ] = 
	                 encrypt( variables[ prop.name ], application.db_key, "DESede") />
	          </cfif>
	     </cfloop>
	 
	</cffunction>
	 
	<cffunction name="decryptProperties" 
	     output="false" 
	     access="public" 
	     returntype="void">
	 
	     <cfset var props = getMetaData( this ).properties />
	 
	     <cfloop array="#props#" index="prop">
	          <cfif structKeyExists(  prop, "encrypted" ) AND prop.encrypted >
	               <cfset variables[ prop.name ] = 
	                 decrypt( variables[ prop.name ], application.db_key, "DESede") />
	          </cfif>
	     </cfloop>
	 
	</cffunction>
</cfcomponent>