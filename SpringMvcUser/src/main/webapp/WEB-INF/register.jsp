<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
        <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <title>Registration</title>
   
        </head>
        <body>
            <form:form name = "regForm" id="regForm" modelAttribute="user" action="registerProcess" method="post"  onsubmit="return validateForm()">
                <table align="center">
                    <tr>
                        <td>
                            <form:label path="username">Username</form:label>
                        </td>
                        <td>
                            <form:input path="username" name="username" id="username"  maxlength="15" title="Must be a combination of letters and numbers" required="required" pattern="[a-zA-Z0-9]+"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="password">Password</form:label>
                        </td>
                        <td>
                            <form:password path="password" name="password" id="password" maxlength="15"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="firstname">FirstName</form:label>
                        </td>
                        <td>
                            <form:input path="firstname" name="firstname" id="firstname" maxlength="15"  title="only letters" pattern="[a-zA-Z]+" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="lastname">LastName</form:label>
                        </td>
                        <td>
                            <form:input path="lastname" name="lastname" id="lastname" maxlength="15"  title="only letters" pattern="[a-zA-Z]+" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="email">Email</form:label>
                        </td>
                        <td>
                            <form:input path="email" name="email" id="email" maxlength="15"  title="match the email format: Bryan@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,63}$" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="address">Address</form:label>
                        </td>
                        <td>
                            <form:input path="address" name="address" id="address" maxlength="15"  title="enter in this format : #1, North Street, Chennai - 11" pattern="^[#.0-9a-zA-Z\s,-]+$" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <form:label path="phone">Phone</form:label>
                        </td>
                        <td>
<%--                             <form:input path="phone" name="phone" id="phone"  title="format : (734)-555-1212" pattern="^(\([0-9]{3}\)|[0-9]{3}-)[0-9]{3}-[0-9]{4}$" required="required"/>  --%>  
								 <form:input path="phone" name="phone" id="phone" class="phone" maxlength="10"/>
				
<!--                           <input type="tel" class="tel" pattern="\d*" x-autocompletetype="tel" autofocus="">
 -->                          <!-- <div class="country">US</div>  -->
              
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <form:button id="register" name="register">Register</form:button>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr>
                        <td></td>
                        <td><a href="home.jsp">Home</a>
                        </td>
                    </tr>
                </table>
            </form:form>
        </body>
        
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript">
        (function($) {
        	  $.fn.caret = function(pos) {
        	    var target = this[0];
        		var isContentEditable = target.contentEditable === 'true';
        	    //get
        	    if (arguments.length == 0) {
        	      //HTML5
        	      if (window.getSelection) {
        	        //contenteditable
        	        if (isContentEditable) {
        	          target.focus();
        	          var range1 = window.getSelection().getRangeAt(0),
        	              range2 = range1.cloneRange();
        	          range2.selectNodeContents(target);
        	          range2.setEnd(range1.endContainer, range1.endOffset);
        	          return range2.toString().length;
        	        }
        	        //textarea
        	        return target.selectionStart;
        	      }
        	      //IE<9
        	      if (document.selection) {
        	        target.focus();
        	        //contenteditable
        	        if (isContentEditable) {
        	            var range1 = document.selection.createRange(),
        	                range2 = document.body.createTextRange();
        	            range2.moveToElementText(target);
        	            range2.setEndPoint('EndToEnd', range1);
        	            return range2.text.length;
        	        }
        	        //textarea
        	        var pos = 0,
        	            range = target.createTextRange(),
        	            range2 = document.selection.createRange().duplicate(),
        	            bookmark = range2.getBookmark();
        	        range.moveToBookmark(bookmark);
        	        while (range.moveStart('character', -1) !== 0) pos++;
        	        return pos;
        	      }
        	      // Addition for jsdom support
        	      if (target.selectionStart)
        	        return target.selectionStart;
        	      //not supported
        	      return 0;
        	    }
        	    //set
        	    if (pos == -1)
        	      pos = this[isContentEditable? 'text' : 'val']().length;
        	    //HTML5
        	    if (window.getSelection) {
        	      //contenteditable
        	      if (isContentEditable) {
        	        target.focus();
        	        window.getSelection().collapse(target.firstChild, pos);
        	      }
        	      //textarea
        	      else
        	        target.setSelectionRange(pos, pos);
        	    }
        	    //IE<9
        	    else if (document.body.createTextRange) {
        	      if (isContentEditable) {
        	        var range = document.body.createTextRange();
        	        range.moveToElementText(target);
        	        range.moveStart('character', pos);
        	        range.collapse(true);
        	        range.select();
        	      } else {
        	        var range = target.createTextRange();
        	        range.move('character', pos);
        	        range.select();
        	      }
        	    }
        	    if (!isContentEditable)
        	      target.focus();
        	    return pos;
        	  }
        	})(jQuery);
        </script>	
        <script type="text/javascript">
     // Generated by CoffeeScript 1.7.1
        (function() {
          var $, checkForCountryChange_, formatBack_, formatForPhone_, formatUp_, format_, formats, formattedPhoneNumber_, formattedPhone_, isEventAllowedChar_, isEventAllowed_, mobilePhoneNumber, prefixesAreSubsets_, restrictEventAndFormat_, supportSelectionEnd, withTimeout,
            __slice = [].slice;

          $ = jQuery;

          supportSelectionEnd = 'selectionEnd' in document.createElement('input');

          withTimeout = function(fn) {
            return setTimeout(fn, 50);
          };

          formatForPhone_ = function(phone, defaultPrefix) {
            var bestFormat, format, k, precision, prefix, v;
            if (defaultPrefix == null) {
              defaultPrefix = null;
            }
            if (phone.indexOf('+') !== 0 && defaultPrefix) {
              phone = defaultPrefix + phone.replace(/[^0-9]/g, '');
            } else {
              phone = '+' + phone.replace(/[^0-9]/g, '');
            }
            bestFormat = null;
            precision = 0;
            for (prefix in formats) {
              format = formats[prefix];
              if (phone.length >= prefix.length && phone.substring(0, prefix.length) === prefix && prefix.length > precision) {
                bestFormat = {};
                for (k in format) {
                  v = format[k];
                  bestFormat[k] = v;
                }
                bestFormat.prefix = prefix;
                precision = prefix.length;
              }
            }
            return bestFormat;
          };

          prefixesAreSubsets_ = function(prefixA, prefixB) {
            if (prefixA === prefixB) {
              return true;
            }
            if (prefixA.length < prefixB.length) {
              return prefixB.substring(0, prefixA.length) === prefixA;
            }
            return prefixA.substring(0, prefixB.length) === prefixB;
          };

          formattedPhoneNumber_ = function(phone, lastChar, defaultPrefix) {
            var format, formatChar, formatDigitCount, formattedPhone, i, phoneDigits, phoneFormat, phonePrefix, prefixPhoneFormat, _i, _j, _len, _ref;
            if (defaultPrefix == null) {
              defaultPrefix = null;
            }
            if (phone.length !== 0 && (phone.substring(0, 1) === "+" || defaultPrefix)) {
              format = formatForPhone_(phone, defaultPrefix);
              if (format && format.format) {
                phoneFormat = format.format;
                phonePrefix = format.prefix;
                if (defaultPrefix) {
                  if ((defaultPrefix === phonePrefix || prefixesAreSubsets_(phonePrefix, defaultPrefix)) && (phone.indexOf('+') !== 0 || phone.length === 0)) {
                    phoneFormat = phoneFormat.substring(Math.min(phonePrefix.length, defaultPrefix.length) + 1);
                    if (format.nationalPrefix != null) {
                      prefixPhoneFormat = "";
                      for (i = _i = 0, _ref = format.nationalPrefix.length; 0 <= _ref ? _i < _ref : _i > _ref; i = 0 <= _ref ? ++_i : --_i) {
                        prefixPhoneFormat += ".";
                      }
                      phoneFormat = prefixPhoneFormat + phoneFormat;
                    }
                  }
                }
                if (phone.substring(0, 1) === "+") {
                  phoneDigits = phone.substring(1);
                } else {
                  phoneDigits = phone;
                }
                formatDigitCount = phoneFormat.match(/\./g).length;
                formattedPhone = "";
                for (_j = 0, _len = phoneFormat.length; _j < _len; _j++) {
                  formatChar = phoneFormat[_j];
                  if (formatChar === ".") {
                    if (phoneDigits.length === 0) {
                      break;
                    }
                    formattedPhone += phoneDigits.substring(0, 1);
                    phoneDigits = phoneDigits.substring(1);
                  } else if (lastChar || phoneDigits.length > 0) {
                    formattedPhone += formatChar;
                  }
                }
                phone = formattedPhone + phoneDigits;
              }
            }
            return phone;
          };

          isEventAllowed_ = function(e) {
            if (e.metaKey) {
              return true;
            }
            if (e.which === 32) {
              return false;
            }
            if (e.which === 0) {
              return true;
            }
            if (e.which < 33) {
              return true;
            }
            return isEventAllowedChar_(e);
          };

          isEventAllowedChar_ = function(e) {
            var charr;
            charr = String.fromCharCode(e.which);
            return !!/[\d\s+]/.test(charr);
          };

          restrictEventAndFormat_ = function(e) {
            var caretEnd, value;
            if (!isEventAllowed_(e)) {
              return e.preventDefault();
            }
            if (!isEventAllowedChar_(e)) {
              return;
            }
            value = this.val();
            caretEnd = supportSelectionEnd ? this.get(0).selectionEnd : this.caret();
            value = value.substring(0, this.caret()) + String.fromCharCode(e.which) + value.substring(caretEnd, value.length);
            format_.call(this, value, e);
            return withTimeout((function(_this) {
              return function() {
                return _this.caret(_this.val().length);
              };
            })(this));
          };

          formatUp_ = function(e) {
            var value;
            checkForCountryChange_.call(this);
            value = this.val();
            if (e.keyCode === 8 && this.caret() === value.length) {
              return;
            }
            return format_.call(this, value, e);
          };

          formatBack_ = function(e) {
            var phone, value;
            if (!e) {
              return;
            }
            if (e.meta) {
              return;
            }
            value = this.val();
            if (value.length === 0) {
              return;
            }
            if (!(this.caret() === value.length)) {
              return;
            }
            if (e.keyCode !== 8) {
              return;
            }
            value = value.substring(0, value.length - 1);
            e.preventDefault();
            phone = formattedPhone_.call(this, value, false);
            if (this.val() !== phone) {
              return this.val(phone);
            }
          };

          format_ = function(value, e) {
            var phone, selection, selectionAtEnd;
            phone = formattedPhone_.call(this, value, true);
            if (phone !== this.val()) {
              selection = this.caret();
              selectionAtEnd = selection === this.val().length;
              e.preventDefault();
              this.val(phone);
              if (!selectionAtEnd) {
                return withTimeout((function(_this) {
                  return function() {
                    return _this.caret(selection);
                  };
                })(this));
              }
            }
          };

          formattedPhone_ = function(phone, lastChar) {
            if (phone.indexOf('+') !== 0 && this.data('defaultPrefix')) {
              phone = phone.replace(/[^0-9]/g, '');
            } else {
              phone = '+' + phone.replace(/[^0-9]/g, '');
            }
            return formattedPhoneNumber_(phone, lastChar, this.data('defaultPrefix'));
          };

          checkForCountryChange_ = function() {
            var country, format, phone;
            phone = this.val();
            format = formatForPhone_(phone, this.data('defaultPrefix'));
            country = null;
            if (format) {
              country = format.country;
            }
            if (this.data('mobilePhoneCountry') !== country) {
              this.data('mobilePhoneCountry', country);
              return this.trigger('country.mobilePhoneNumber', country);
            }
          };

          mobilePhoneNumber = {};

          mobilePhoneNumber.init = function(options) {
            var _ref;
            if (options == null) {
              options = {};
            }
            if (!this.data('mobilePhoneNumberInited')) {
              this.data('mobilePhoneNumberInited', true);
              this.bind('keypress', (function(_this) {
                return function() {
                  return restrictEventAndFormat_.apply($(_this), arguments);
                };
              })(this));
              this.bind('keyup', (function(_this) {
                return function() {
                  return formatUp_.apply($(_this), arguments);
                };
              })(this));
              this.bind('keydown', (function(_this) {
                return function() {
                  return formatBack_.apply($(_this), arguments);
                };
              })(this));
            }
            this.data('defaultPrefix', (_ref = options.allowPhoneWithoutPrefix) != null ? _ref : options.defaultPrefix);
            if (this.val() !== '') {
              this.val(formattedPhone_.call(this, this.val(), false));
            }
            return this;
          };

          mobilePhoneNumber.val = function() {
            var format, val;
            val = this.val().replace(/[^0-9]/g, '');
            format = formatForPhone_(val, this.data('defaultPrefix'));
            if (this.val().indexOf('+') === 0 || (this.data('defaultPrefix') == null)) {
              return '+' + val;
            } else {
              return this.data('defaultPrefix') + val;
            }
          };

          mobilePhoneNumber.validate = function() {
            var format, val;
            val = this.mobilePhoneNumber('val');
            format = formatForPhone_(val, this.data('defaultPrefix'));
            if (!format) {
              return true;
            }
            return val.length > format.prefix.length;
          };

          mobilePhoneNumber.country = function() {
            var format;
            format = formatForPhone_(this.mobilePhoneNumber('val'));
            if (format) {
              return format.country;
            }
          };

          mobilePhoneNumber.prefix = function() {
            var countryCode;
            countryCode = this.mobilePhoneNumber('country');
            if (countryCode == null) {
              return "";
            }
            return $.mobilePhoneNumberPrefixFromCountryCode(countryCode);
          };

          $.fn.mobilePhoneNumber = function() {
            var args, method;
            method = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
            if ((method == null) || !(typeof method === 'string')) {
              if (method != null) {
                args = [method];
              }
              method = 'init';
            }
            return mobilePhoneNumber[method].apply(this, args);
          };

          $.formatMobilePhoneNumber = function(phone) {
            phone = '+' + phone.replace(/[^0-9\*]/g, '');
            return formattedPhoneNumber_(phone, true);
          };

          $.mobilePhoneNumberPrefixFromCountryCode = function(countryCode) {
            var format, prefix;
            for (prefix in formats) {
              format = formats[prefix];
              if (format.country.toLowerCase() === countryCode.toLowerCase()) {
                if (prefix.length === 5 && prefix[1] === '1') {
                  return '+1';
                }
                return prefix;
              }
            }
            return null;
          };

          formats = {
            '+247': {
              country: 'AC'
            },
            '+376': {
              country: 'AD',
              format: '+... ... ...'
            },
            '+971': {
              country: 'AE',
              format: '+... .. ... ....'
            },
            '+93': {
              country: 'AF',
              format: '+.. .. ... ....'
            },
            '+1268': {
              country: 'AG'
            },
            '+1264': {
              country: 'AI'
            },
            '+355': {
              country: 'AL',
              format: '+... .. ... ....'
            },
            '+374': {
              country: 'AM',
              format: '+... .. ......'
            },
            '+244': {
              country: 'AO',
              format: '+... ... ... ...'
            },
            '+54': {
              country: 'AR',
              format: '+.. .. ..-....-....'
            },
            '+1684': {
              country: 'AS'
            },
            '+43': {
              country: 'AT',
              format: '+.. ... ......'
            },
            '+61': {
              country: 'AU',
              format: '+.. ... ... ...'
            },
            '+297': {
              country: 'AW',
              format: '+... ... ....'
            },
            '+994': {
              country: 'AZ',
              format: '+... .. ... .. ..'
            },
            '+387': {
              country: 'BA',
              format: '+... .. ...-...'
            },
            '+1246': {
              country: 'BB'
            },
            '+880': {
              country: 'BD',
              format: '+... ....-......'
            },
            '+32': {
              country: 'BE',
              format: '+.. ... .. .. ..'
            },
            '+226': {
              country: 'BF',
              format: '+... .. .. .. ..'
            },
            '+359': {
              country: 'BG',
              format: '+... ... ... ..'
            },
            '+973': {
              country: 'BH',
              format: '+... .... ....'
            },
            '+257': {
              country: 'BI',
              format: '+... .. .. .. ..'
            },
            '+229': {
              country: 'BJ',
              format: '+... .. .. .. ..'
            },
            '+1441': {
              country: 'BM'
            },
            '+673': {
              country: 'BN',
              format: '+... ... ....'
            },
            '+591': {
              country: 'BO',
              format: '+... ........'
            },
            '+55': {
              country: 'BR',
              format: '+.. .. .....-....'
            },
            '+1242': {
              country: 'BS'
            },
            '+975': {
              country: 'BT',
              format: '+... .. .. .. ..'
            },
            '+267': {
              country: 'BW',
              format: '+... .. ... ...'
            },
            '+375': {
              country: 'BY',
              format: '+... .. ...-..-..'
            },
            '+501': {
              country: 'BZ',
              format: '+... ...-....'
            },
            '+243': {
              country: 'CD',
              format: '+... ... ... ...'
            },
            '+236': {
              country: 'CF',
              format: '+... .. .. .. ..'
            },
            '+242': {
              country: 'CG',
              format: '+... .. ... ....'
            },
            '+41': {
              country: 'CH',
              format: '+.. .. ... .. ..'
            },
            '+225': {
              country: 'CI',
              format: '+... .. .. .. ..'
            },
            '+682': {
              country: 'CK',
              format: '+... .. ...'
            },
            '+56': {
              country: 'CL',
              format: '+.. . .... ....'
            },
            '+237': {
              country: 'CM',
              format: '+... .. .. .. ..'
            },
            '+86': {
              country: 'CN',
              format: '+.. ... .... ....'
            },
            '+57': {
              country: 'CO',
              format: '+.. ... .......'
            },
            '+506': {
              country: 'CR',
              format: '+... .... ....'
            },
            '+53': {
              country: 'CU',
              format: '+.. . .......'
            },
            '+238': {
              country: 'CV',
              format: '+... ... .. ..'
            },
            '+599': {
              country: 'CW',
              format: '+... . ... ....'
            },
            '+537': {
              country: 'CY'
            },
            '+357': {
              country: 'CY',
              format: '+... .. ......'
            },
            '+420': {
              country: 'CZ',
              format: '+... ... ... ...'
            },
            '+49': {
              country: 'DE',
              format: '+.. .... .......'
            },
            '+253': {
              country: 'DJ',
              format: '+... .. .. .. ..'
            },
            '+45': {
              country: 'DK',
              format: '+.. .. .. .. ..'
            },
            '+1767': {
              country: 'DM'
            },
            '+1849': {
              country: 'DO'
            },
            '+213': {
              country: 'DZ',
              format: '+... ... .. .. ..'
            },
            '+593': {
              country: 'EC',
              format: '+... .. ... ....'
            },
            '+372': {
              country: 'EE',
              format: '+... .... ....'
            },
            '+20': {
              country: 'EG',
              format: '+.. ... ... ....'
            },
            '+291': {
              country: 'ER',
              format: '+... . ... ...'
            },
            '+34': {
              country: 'ES',
              format: '+.. ... .. .. ..'
            },
            '+251': {
              country: 'ET',
              format: '+... .. ... ....'
            },
            '+358': {
              country: 'FI',
              format: '+... .. ... .. ..'
            },
            '+679': {
              country: 'FJ',
              format: '+... ... ....'
            },
            '+500': {
              country: 'FK'
            },
            '+691': {
              country: 'FM',
              format: '+... ... ....'
            },
            '+298': {
              country: 'FO',
              format: '+... ......'
            },
            '+33': {
              country: 'FR',
              format: '+.. . .. .. .. ..'
            },
            '+241': {
              country: 'GA',
              format: '+... .. .. .. ..'
            },
            '+44': {
              country: 'GB',
              format: '+.. .... ......'
            },
            '+1473': {
              country: 'GD'
            },
            '+995': {
              country: 'GE',
              format: '+... ... .. .. ..'
            },
            '+594': {
              country: 'GF',
              format: '+... ... .. .. ..'
            },
            '+233': {
              country: 'GH',
              format: '+... .. ... ....'
            },
            '+350': {
              country: 'GI',
              format: '+... ... .....'
            },
            '+299': {
              country: 'GL',
              format: '+... .. .. ..'
            },
            '+220': {
              country: 'GM',
              format: '+... ... ....'
            },
            '+224': {
              country: 'GN',
              format: '+... ... .. .. ..'
            },
            '+240': {
              country: 'GQ',
              format: '+... ... ... ...'
            },
            '+30': {
              country: 'GR',
              format: '+.. ... ... ....'
            },
            '+502': {
              country: 'GT',
              format: '+... .... ....'
            },
            '+1671': {
              country: 'GU'
            },
            '+245': {
              country: 'GW',
              format: '+... ... ....'
            },
            '+592': {
              country: 'GY',
              format: '+... ... ....'
            },
            '+852': {
              country: 'HK',
              format: '+... .... ....'
            },
            '+504': {
              country: 'HN',
              format: '+... ....-....'
            },
            '+385': {
              country: 'HR',
              format: '+... .. ... ....'
            },
            '+509': {
              country: 'HT',
              format: '+... .. .. ....'
            },
            '+36': {
              country: 'HU',
              format: '+.. .. ... ....'
            },
            '+62': {
              country: 'ID',
              format: '+.. ...-...-...'
            },
            '+353': {
              country: 'IE',
              format: '+... .. ... ....'
            },
            '+972': {
              country: 'IL',
              format: '+... ..-...-....'
            },
            '+91': {
              country: 'IN',
              format: '+.. .. .. ......'
            },
            '+246': {
              country: 'IO',
              format: '+... ... ....'
            },
            '+964': {
              country: 'IQ',
              format: '+... ... ... ....'
            },
            '+98': {
              country: 'IR',
              format: '+.. ... ... ....'
            },
            '+354': {
              country: 'IS',
              format: '+... ... ....'
            },
            '+39': {
              country: 'IT',
              format: '+.. .. .... ....'
            },
            '+1876': {
              country: 'JM'
            },
            '+962': {
              country: 'JO',
              format: '+... . .... ....'
            },
            '+81': {
              country: 'JP',
              format: '+.. ..-....-....',
              nationalPrefix: '0'
            },
            '+254': {
              country: 'KE',
              format: '+... .. .......'
            },
            '+996': {
              country: 'KG',
              format: '+... ... ... ...'
            },
            '+855': {
              country: 'KH',
              format: '+... .. ... ...'
            },
            '+686': {
              country: 'KI'
            },
            '+269': {
              country: 'KM',
              format: '+... ... .. ..'
            },
            '+1869': {
              country: 'KN'
            },
            '+850': {
              country: 'KP',
              format: '+... ... ... ....'
            },
            '+82': {
              country: 'KR',
              format: '+.. ..-....-....'
            },
            '+965': {
              country: 'KW',
              format: '+... ... .....'
            },
            '+345': {
              country: 'KY'
            },
            '+77': {
              country: 'KZ'
            },
            '+856': {
              country: 'LA',
              format: '+... .. .. ... ...'
            },
            '+961': {
              country: 'LB',
              format: '+... .. ... ...'
            },
            '+1758': {
              country: 'LC'
            },
            '+423': {
              country: 'LI',
              format: '+... ... ... ...'
            },
            '+94': {
              country: 'LK',
              format: '+.. .. . ......'
            },
            '+231': {
              country: 'LR',
              format: '+... ... ... ...'
            },
            '+266': {
              country: 'LS',
              format: '+... .... ....'
            },
            '+370': {
              country: 'LT',
              format: '+... ... .....'
            },
            '+352': {
              country: 'LU',
              format: '+... .. .. .. ...'
            },
            '+371': {
              country: 'LV',
              format: '+... .. ... ...'
            },
            '+218': {
              country: 'LY',
              format: '+... ..-.......'
            },
            '+212': {
              country: 'MA',
              format: '+... ...-......'
            },
            '+377': {
              country: 'MC',
              format: '+... . .. .. .. ..'
            },
            '+373': {
              country: 'MD',
              format: '+... ... .. ...'
            },
            '+382': {
              country: 'ME',
              format: '+... .. ... ...'
            },
            '+590': {
              country: 'MF'
            },
            '+261': {
              country: 'MG',
              format: '+... .. .. ... ..'
            },
            '+692': {
              country: 'MH',
              format: '+... ...-....'
            },
            '+389': {
              country: 'MK',
              format: '+... .. ... ...'
            },
            '+223': {
              country: 'ML',
              format: '+... .. .. .. ..'
            },
            '+95': {
              country: 'MM',
              format: '+.. . ... ....'
            },
            '+976': {
              country: 'MN',
              format: '+... .... ....'
            },
            '+853': {
              country: 'MO',
              format: '+... .... ....'
            },
            '+1670': {
              country: 'MP'
            },
            '+596': {
              country: 'MQ',
              format: '+... ... .. .. ..'
            },
            '+222': {
              country: 'MR',
              format: '+... .. .. .. ..'
            },
            '+1664': {
              country: 'MS'
            },
            '+356': {
              country: 'MT',
              format: '+... .... ....'
            },
            '+230': {
              country: 'MU',
              format: '+... .... ....'
            },
            '+960': {
              country: 'MV',
              format: '+... ...-....'
            },
            '+265': {
              country: 'MW',
              format: '+... ... .. .. ..'
            },
            '+52': {
              country: 'MX',
              format: '+.. ... ... ... ....'
            },
            '+60': {
              country: 'MY',
              format: '+.. ..-... ....'
            },
            '+258': {
              country: 'MZ',
              format: '+... .. ... ....'
            },
            '+264': {
              country: 'NA',
              format: '+... .. ... ....'
            },
            '+687': {
              country: 'NC',
              format: '+... ........'
            },
            '+227': {
              country: 'NE',
              format: '+... .. .. .. ..'
            },
            '+672': {
              country: 'NF',
              format: '+... .. ....'
            },
            '+234': {
              country: 'NG',
              format: '+... ... ... ....'
            },
            '+505': {
              country: 'NI',
              format: '+... .... ....'
            },
            '+31': {
              country: 'NL',
              format: '+.. . ........'
            },
            '+47': {
              country: 'NO',
              format: '+.. ... .. ...'
            },
            '+977': {
              country: 'NP',
              format: '+... ...-.......'
            },
            '+674': {
              country: 'NR',
              format: '+... ... ....'
            },
            '+683': {
              country: 'NU'
            },
            '+64': {
              country: 'NZ',
              format: '+.. .. ... ....'
            },
            '+968': {
              country: 'OM',
              format: '+... .... ....'
            },
            '+507': {
              country: 'PA',
              format: '+... ....-....'
            },
            '+51': {
              country: 'PE',
              format: '+.. ... ... ...'
            },
            '+689': {
              country: 'PF',
              format: '+... .. .. ..'
            },
            '+675': {
              country: 'PG',
              format: '+... ... ....'
            },
            '+63': {
              country: 'PH',
              format: '+.. .... ......'
            },
            '+92': {
              country: 'PK',
              format: '+.. ... .......'
            },
            '+48': {
              country: 'PL',
              format: '+.. .. ... .. ..'
            },
            '+508': {
              country: 'PM',
              format: '+... .. .. ..'
            },
            '+872': {
              country: 'PN'
            },
            '+1939': {
              country: 'PR'
            },
            '+970': {
              country: 'PS',
              format: '+... ... ... ...'
            },
            '+351': {
              country: 'PT',
              format: '+... ... ... ...'
            },
            '+680': {
              country: 'PW',
              format: '+... ... ....'
            },
            '+595': {
              country: 'PY',
              format: '+... .. .......'
            },
            '+974': {
              country: 'QA',
              format: '+... .... ....'
            },
            '+262': {
              country: 'RE'
            },
            '+40': {
              country: 'RO',
              format: '+.. .. ... ....'
            },
            '+381': {
              country: 'RS',
              format: '+... .. .......'
            },
            '+7': {
              country: 'RU',
              format: '+. ... ...-..-..'
            },
            '+250': {
              country: 'RW',
              format: '+... ... ... ...'
            },
            '+966': {
              country: 'SA',
              format: '+... .. ... ....'
            },
            '+677': {
              country: 'SB',
              format: '+... ... ....'
            },
            '+248': {
              country: 'SC',
              format: '+... . ... ...'
            },
            '+249': {
              country: 'SD',
              format: '+... .. ... ....'
            },
            '+46': {
              country: 'SE',
              format: '+.. ..-... .. ..'
            },
            '+65': {
              country: 'SG',
              format: '+.. .... ....'
            },
            '+290': {
              country: 'SH'
            },
            '+386': {
              country: 'SI',
              format: '+... .. ... ...'
            },
            '+421': {
              country: 'SK',
              format: '+... ... ... ...'
            },
            '+232': {
              country: 'SL',
              format: '+... .. ......'
            },
            '+378': {
              country: 'SM',
              format: '+... .. .. .. ..'
            },
            '+221': {
              country: 'SN',
              format: '+... .. ... .. ..'
            },
            '+252': {
              country: 'SO',
              format: '+... .. .......'
            },
            '+597': {
              country: 'SR',
              format: '+... ...-....'
            },
            '+211': {
              country: 'SS',
              format: '+... ... ... ...'
            },
            '+239': {
              country: 'ST',
              format: '+... ... ....'
            },
            '+503': {
              country: 'SV',
              format: '+... .... ....'
            },
            '+963': {
              country: 'SY',
              format: '+... ... ... ...'
            },
            '+268': {
              country: 'SZ',
              format: '+... .... ....'
            },
            '+1649': {
              country: 'TC'
            },
            '+235': {
              country: 'TD',
              format: '+... .. .. .. ..'
            },
            '+228': {
              country: 'TG',
              format: '+... .. .. .. ..'
            },
            '+66': {
              country: 'TH',
              format: '+.. .. ... ....'
            },
            '+992': {
              country: 'TJ',
              format: '+... ... .. ....'
            },
            '+690': {
              country: 'TK'
            },
            '+670': {
              country: 'TL',
              format: '+... .... ....'
            },
            '+993': {
              country: 'TM',
              format: '+... .. ..-..-..'
            },
            '+216': {
              country: 'TN',
              format: '+... .. ... ...'
            },
            '+676': {
              country: 'TO',
              format: '+... ... ....'
            },
            '+90': {
              country: 'TR',
              format: '+.. ... ... ....'
            },
            '+1868': {
              country: 'TT'
            },
            '+688': {
              country: 'TV'
            },
            '+886': {
              country: 'TW',
              format: '+... ... ... ...'
            },
            '+255': {
              country: 'TZ',
              format: '+... ... ... ...'
            },
            '+380': {
              country: 'UA',
              format: '+... .. ... ....'
            },
            '+256': {
              country: 'UG',
              format: '+... ... ......'
            },
            '+1': {
              country: 'US'
            },
            '+598': {
              country: 'UY',
              format: '+... .... ....'
            },
            '+998': {
              country: 'UZ',
              format: '+... .. ... .. ..'
            },
            '+379': {
              country: 'VA'
            },
            '+1784': {
              country: 'VC'
            },
            '+58': {
              country: 'VE',
              format: '+.. ...-.......'
            },
            '+1284': {
              country: 'VG'
            },
            '+1340': {
              country: 'VI'
            },
            '+84': {
              country: 'VN',
              format: '+.. .. ... .. ..'
            },
            '+678': {
              country: 'VU',
              format: '+... ... ....'
            },
            '+681': {
              country: 'WF',
              format: '+... .. .. ..'
            },
            '+685': {
              country: 'WS'
            },
            '+967': {
              country: 'YE',
              format: '+... ... ... ...'
            },
            '+27': {
              country: 'ZA',
              format: '+.. .. ... ....'
            },
            '+260': {
              country: 'ZM',
              format: '+... .. .......'
            },
            '+263': {
              country: 'ZW',
              format: '+... .. ... ....'
            }
          };

          (function(formats) {
            var canadaPrefixes, format, prefix, _i, _len, _results;
            canadaPrefixes = [403, 587, 780, 250, 604, 778, 204, 506, 709, 902, 226, 249, 289, 343, 416, 519, 613, 647, 705, 807, 905, 418, 438, 450, 514, 579, 581, 819, 873, 306, 867];
            for (_i = 0, _len = canadaPrefixes.length; _i < _len; _i++) {
              prefix = canadaPrefixes[_i];
              formats['+1' + prefix] = {
                country: 'CA'
              };
            }
            _results = [];
            for (prefix in formats) {
              format = formats[prefix];
              if (prefix.substring(0, 2) === "+1") {
                _results.push(format.format = '+. (...) ...-....');
              } else {
                _results.push(void 0);
              }
            }
            return _results;
          })(formats);

        }).call(this);
        </script>	
        <script>
		    jQuery(function($){
		     
		      var input = $('.phone')
		      input.mobilePhoneNumber({allowPhoneWithoutPrefix: '+1'});
		      input.bind('country.mobilePhoneNumber', function(e, country) {
		        $('.country').text(country || '')
		      })
		    });
		    $('form').submit(function(){
		    	debugger;
		    	$('#phone').val($('#phone').val().substring(0, 14))
		    })
  </script>
        
        </html>