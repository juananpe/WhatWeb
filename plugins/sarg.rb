##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "SARG"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-06-22
]
version "0.1"
description "Squid Analysis Report Generator (SARG) is a tool that allow you to view where your users are going to on the Internet."
website "http://sarg.sourceforge.net/sarg.php"

# 195 for inurl:sarg inurl:siteuser.html ext:html
#  59 for inurl:sarg inurl:siteuser.html ext:html "Squid User Access Report"

# Dorks #
dorks [
'inurl:sarg inurl:siteuser.html ext:html'
]



# Matches #
matches [

# Title
{ :text=>"<title>Squid User's Access Report</title>" },

# Logo + Link HTML
{ :text=>'<tr><th class="logo"><a href="http://sarg.sourceforge.net"><img src="./images/sarg.png" border="0" align="absmiddle" title="SARG, Squid Analysis Report Generator. Logo by Osamu Matsuzaki"></a>&nbsp;<font class="logo">Squid Analysis Report Generator</font></th></tr>' },
{ :text=>'<tr><th class="logo"><a href="http://sarg.sourceforge.net"><img src="../images/sarg.png" border="0" align="absmiddle" title="SARG, Squid Analysis Report Generator. Logo by Osamu Matsuzaki"></a>&nbsp;<font class="logo">Squid Analysis Report Generator</font></th></tr>' },
{ :text=>'<tr><th><a href="http://sarg.sourceforge.net"><img src="./images/sarg.png" title="SARG, Squid Analysis Report Generator. Logo by Osamu Matsuzaki" alt="Sarg"></a>&nbsp;Squid Analysis Report Generator</th></tr>' },

# Table Title
{ :regexp=>/<tr><th (align="center" )?class="title(_c)?">Squid User Access Reports?<\/th><\/tr>/ },

# Version Detection # Generated by footer
{ :version=>/<(div|td) class="info">(Generated by|Gerado por)? <a href='http:\/\/sarg\.sourceforge\.net'>(<font class="info">)?sarg-([^\s]+)/, :offset=>3 },

]

end

