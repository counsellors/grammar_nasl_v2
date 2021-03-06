#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(83764);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2016/05/09 20:31:00 $");

  script_cve_id("CVE-2014-7810");
  script_bugtraq_id(74665);
  script_osvdb_id(122158);

  script_name(english:"Apache Tomcat 7.0.x < 7.0.59 Security Manager Bypass");
  script_summary(english:"Checks the Apache Tomcat Version.");

  script_set_attribute(attribute:"synopsis", value:
"The remote Apache Tomcat server is affected by a security bypass
vulnerability.");
  script_set_attribute(attribute:"description", value:
"According to its self-reported version number, the Apache Tomcat
server listening on the remote host is 7.0.x prior to 7.0.59. It is,
therefore, affected by a security bypass vulnerability due to a flaw
that occurs when handling expression language. A remote attacker can
exploit this, via a crafted web application, to bypass the security
manager protection and execute arbitrary code.

Note that Nessus has not tested for this issue but has instead relied
only on the application's self-reported version number.");
  # http://tomcat.apache.org/tomcat-7.0-doc/changelog.html#Tomcat_7.0.58_(violetagg)
  script_set_attribute(attribute:"see_also", value:"http://www.nessus.org/u?edd653ec");
  script_set_attribute(attribute:"see_also", value:"http://tomcat.apache.org/security-7.html#Fixed_in_Apache_Tomcat_7.0.59");
  script_set_attribute(attribute:"see_also", value:"http://seclists.org/bugtraq/2015/May/94");
  script_set_attribute(attribute:"solution", value:
"Upgrade to Apache Tomcat version 7.0.59 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"vuln_publication_date", value:"2015/05/14");
  script_set_attribute(attribute:"patch_publication_date", value:"2015/02/04");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/05/21");

  script_set_attribute(attribute:"plugin_type", value:"remote");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apache:tomcat");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Web Servers");

  script_copyright(english:"This script is Copyright (C) 2015-2016 Tenable Network Security, Inc.");

  script_dependencies("tomcat_error_version.nasl", "os_fingerprint.nasl");
  script_require_ports("Services/www", 8080);
  script_require_keys("www/tomcat");

  exit(0);
}

include("tomcat_version.inc");

tomcat_check_version(fixed:"7.0.58", min:"7.0.0", severity:SECURITY_WARNING, granularity_regex:"^7(\.0)?$");
