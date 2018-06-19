<cfscript>
// 'Tom' gets encrypted DURING set
entityLoadByPK('users', 3).firstname = 'TOM';

// DB value gets decrypted to 'Tom' during get
entityLoadByPK('users', 3).firstname;
</cfscript>