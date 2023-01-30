function add(user, pass) {
  console.log("ja ho");
  var username = document.getElementById('username');
  var password = document.getElementById('password');
  var remember = document.getElementById('remember-me');
  var sub = document.querySelectorAll('input[type=submit]')[0];
  const event = new Event('input', { bubbles: true }); 
  username.value = user;
  password.value = pass;
  username.dispatchEvent(event);
  password.dispatchEvent(event);
  remember.click();
  sub.click();
  console.log(a);
}