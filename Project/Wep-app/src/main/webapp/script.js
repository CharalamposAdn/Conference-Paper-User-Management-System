

console.log('Script executed'); // Check if script is executed

$(document).ready(function () {
    // Check if "Remember me" preference is set
    var rememberMe = localStorage.getItem('rememberMe') === 'true';
    $('#remember-me').prop('checked', rememberMe);

    // If "Remember me" is checked, fill in the form with the previous login info
    if (rememberMe) {
        var previousLoginInfo = localStorage.getItem('loginInfo');
        if (previousLoginInfo) {
            var loginInfo = JSON.parse(previousLoginInfo);
            $('#name').val(loginInfo.name);
            $('#password').val(loginInfo.password);
        }
    }

    // Handle form submission
    $('#login-form').submit(function (event) {
        console.log('Form submitted'); // Check if form submission is triggered

        // Check if "Remember me" checkbox is checked
        if ($('#remember-me').prop('checked')) {
            // Save login info to local storage
            var loginInfo = {
                name: $('#name').val(),
                password: $('#password').val()
            };
            localStorage.setItem('loginInfo', JSON.stringify(loginInfo));
            localStorage.setItem('rememberMe', 'true');
        } else {
            // Clear login info from local storage
            localStorage.removeItem('loginInfo');
            localStorage.removeItem('rememberMe');

            // Show a message
            alert('Please check the "Remember me" checkbox to remember your login.');

            // Prevent form submission
            event.preventDefault();
        }
    });
});
