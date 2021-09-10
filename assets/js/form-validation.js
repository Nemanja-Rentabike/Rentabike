$(function() {
    $("form[name='rent_bike']").validate({
        rules: {
            fromdate: {
                required: true,
                datechecker: true,

            },
            todate: {
                required: true,
                datechecker: true
            },
            message: {
                required: true,
            },
        },
        messages: {
            fromdate: {
                required: "Please insert FROM date",
            },
            todate: {
                required: "Please insert TO date",
            },
            message: "Please enter a message"
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});

$.validator.addMethod(
    "datechecker",
    function(value, element) {
        return value.match(/^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$/);
    },
    "Please enter a date in the format dd/mm/yyyy."
);

$(function() {
    $("form[name='login_form']").validate({
        rules: {
            email: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                email: true,
                regex: /^\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i,

            },
            password: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                maxlength: 10,
            },
        },
        messages: {
            email: {
                required: "Please enter an email",
                email: "Please enter a valid email address!",
                regex: "Please enter a valid email address!"
            },
            password: {
                required: "Please enter a password",
                minlength: "The password must have at least 5 characters!",
                maxlength: "The password cannot be longer than 10 characters!"
            },
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});

$.validator.addMethod(
    "regex",

    function(value, element, regexp)  {

        if (regexp && regexp.constructor != RegExp) {
            regexp = new RegExp(regexp);
        }

        else if (regexp.global) regexp.lastIndex = 0;

        return this.optional(element) || regexp.test(value);
    }
);

$.validator.addMethod('requiredNotBlank', function(value, element) {
    return $.validator.methods.required.call(this, $.trim(value), element);
}, $.validator.messages.required);

$(function() {
    $("form[name='signup']").validate({
        rules: {
            password: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                maxlength: 10,
            },

            mobileno: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                number: true,
                minlength: 6
            },

            fullname: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
            },

            confirmpassword: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                equalTo: "#password"
            }
        },
        messages: {
            password: {
                required: "Please enter a password",
                minlength: "The password must have at least 5 characters!",
                maxlength: "The password cannot be longer than 10 characters!"
            },
            mobileno: {
                required: "Please enter a phone",
                number: "Phone must contain only numbers",
                minlength: "The phone must have at least 6 numbers!",
            },

            fullname: {
                required: "Please enter a fullname",
            },

            confirmpassword: {
                required: "Please enter a password",
                minlength: "The password must have at least 5 characters!",
                equalTo: "Passwords do not match!"
            }
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});

$(function() {
    $("form[name='chngpwd']").validate({
        rules: {
            password: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                maxlength: 10,
            },

            newpassword: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                maxlength: 10,
            },
            confirmpassword: {
                required: {
                    depends:function(){
                        $(this).val($.trim($(this).val()));
                        return true;
                    }
                },
                minlength: 5,
                maxlength: 10,
                equalTo: "#newpassword"
            },

        },
        messages: {
            password: {
                required: "Please enter a current password",
                minlength: "The password must have at least 5 characters!",
                maxlength: "The password cannot be longer than 10 characters!"
            },
            newpassword: {
                required: "Please enter a new password",
                minlength: "The password must have at least 5 characters!",
                maxlength: "The password cannot be longer than 10 characters!"
            },
            confirmpassword: {
                required: "Please repeat a new password",
                minlength: "The password must have at least 5 characters!",
                maxlength: "The password cannot be longer than 10 characters!",
                equalTo: "Passwords do not match!"
            },
        },
        submitHandler: function(form) {
            form.submit();
        }
    });
});







