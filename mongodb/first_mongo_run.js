db.createUser({ 
  user: 'admin', 
  pwd: 'admin', 
  roles: [{ 
    role: 'userAdminAnyDatabase',
    db: 'admin' 
  }] 
}); 
db = db.getSiblingDB('dev');
db.createUser({ 
  user: 'dev',   
  pwd: 'dev',   
  roles: [ { 
    role: 'readWrite', 
    db: 'dev'   
  }] 
});

