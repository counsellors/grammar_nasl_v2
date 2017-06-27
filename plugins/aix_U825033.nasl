#
# (C) Tenable Network Security, Inc.
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(38608);
 script_version ("$Revision: 1.3 $");
 
 script_name(english: "AIX 530007 : U825033");
 
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing a vendor supplied security patch");
 script_set_attribute(attribute: "description", value:
"The remote host is missing AIX PTF U825033 which is related
to the security of the package radius.base.rte.2.1.7.1

You should install this PTF for your system to be up-to-date.");
 script_set_attribute(attribute: "solution", value: 
"Run 'suma -x -a RqType=Security' on the remote system");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_set_attribute(attribute: "plugin_type", value: "local");
 script_cvs_date("$Date: 2011/03/14 20:11:39 $");
 script_set_attribute(attribute:"plugin_publication_date", value: "2009/04/30");
 script_end_attributes();
 
 script_summary(english: "Check for PTF U825033");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009-2011 Tenable Network Security, Inc.");
 script_family(english: "AIX Local Security Checks");
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/AIX/lslpp");
 exit(0);
}



include("aix.inc");
if ( ! get_kb_item("Host/AIX/lslpp") ) exit(1, "No patch information");


if ( aix_check_patch(ml:"530007", patch:"U825033", package:"radius.base.rte.2.1.7.1") < 0 ) 
  security_hole(port:0, extra:aix_report_get());
else exit(0, "Host is not vulnerable");