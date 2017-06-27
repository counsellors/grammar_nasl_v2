#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(66428);
  script_version("$Revision: 1.12 $");
  script_cvs_date("$Date: 2016/05/09 20:31:00 $");

  script_cve_id("CVE-2013-2071", "CVE-2013-4444");
  script_bugtraq_id(59798, 69728);
  script_osvdb_id(93254);

  script_name(english:"Apache Tomcat 7.0.x < 7.0.40 Multiple Vulnerabilities");
  script_summary(english:"Checks the Apache Tomcat version.");

  script_set_attribute(attribute:"synopsis", value:
"The remote Apache Tomcat server is affected by multiple 
vulnerabilities.");
  script_set_attribute(attribute:"description", value:
"According to its self-reported version number, the instance of Apache
Tomcat 7.0 listening on the remote host is prior to 7.0.40. It is,
therefore, affected by multiple vulnerabilities :
 
  - An error exists related to 'AsyncListeners' that throw
    'RuntimeExceptions' that allow elements of certain
    requests to be disclosed in responses to other requests.
    (CVE-2013-2071)

  - It is possible to upload a malicious JSP to a Tomcat
    server and subsequently trigger execution of that JSP.
    (CVE-2013-4444)

Note that Nessus has not tested for these issues but has instead
relied only on the application's self-reported version number.");
  script_set_attribute(attribute:"see_also", value:"http://www.securityfocus.com/archive/1/533399/30/0/threaded");
  script_set_attribute(attribute:"see_also", value:"http://tomcat.apache.org/security-7.html#Fixed_in_Apache_Tomcat_7.0.40");
  script_set_attribute(attribute:"solution", value:"Update to Apache Tomcat version 7.0.40 or later.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:H/Au:N/C:P/I:N/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");

  script_set_attribute(attribute:"vuln_publication_date", value:"2013/05/10");
  script_set_attribute(attribute:"patch_publication_date", value:"2013/05/09");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/05/15");

  script_set_attribute(attribute:"plugin_type", value:"remote");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:apache:tomcat");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_family(english:"Web Servers");

  script_copyright(english:"This script is Copyright (C) 2013-2016 Tenable Network Security, Inc.");

  script_dependencies("tomcat_error_version.nasl");
  script_require_ports("Services/www", 8080);
  script_require_keys("www/tomcat");

  exit(0);
}

include("tomcat_version.inc");

tomcat_check_version(fixed:"7.0.40", min:"7.0.0", severity:SECURITY_NOTE, granularity_regex:"^7(\.0)?$");