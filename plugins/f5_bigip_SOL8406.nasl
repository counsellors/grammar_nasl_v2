#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from F5 Networks BIG-IP Solution SOL8406.
#
# The text description of this plugin is (C) F5 Networks.
#

include("compat.inc");

if (description)
{
  script_id(78221);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/10/31 13:56:11 $");

  script_cve_id("CVE-2008-0539");
  script_bugtraq_id(27462, 28151);
  script_osvdb_id(40692);

  script_name(english:"F5 Networks BIG-IP : The BIG-IP ASM web management interface XSS vulnerability (SOL8406)");
  script_summary(english:"Checks the BIG-IP version.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote device is missing a vendor-supplied security patch."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The remote BIG-IP device is missing a patch required by a security
advisory."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://support.f5.com/kb/en-us/solutions/public/8000/400/sol8406.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Upgrade to one of the non-vulnerable versions listed in the F5
Solution SOL8406."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:N/I:P/A:N");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:U/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_cwe_id(79);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/a:f5:big-ip_application_security_manager");
  script_set_attribute(attribute:"cpe", value:"cpe:/h:f5:big-ip");

  script_set_attribute(attribute:"patch_publication_date", value:"2008/02/06");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/10/10");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2016 Tenable Network Security, Inc.");
  script_family(english:"F5 Networks Local Security Checks");

  script_dependencies("f5_bigip_detect.nbin");
  script_require_keys("Host/local_checks_enabled", "Host/BIG-IP/hotfix", "Host/BIG-IP/modules", "Host/BIG-IP/version");

  exit(0);
}


include("f5_func.inc");

if ( ! get_kb_item("Host/local_checks_enabled") ) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
version = get_kb_item("Host/BIG-IP/version");
if ( ! version ) audit(AUDIT_OS_NOT, "F5 Networks BIG-IP");
if ( isnull(get_kb_item("Host/BIG-IP/hotfix")) ) audit(AUDIT_KB_MISSING, "Host/BIG-IP/hotfix");
if ( ! get_kb_item("Host/BIG-IP/modules") ) audit(AUDIT_KB_MISSING, "Host/BIG-IP/modules");

sol = "SOL8406";
vmatrix = make_array();

# ASM
vmatrix["ASM"] = make_array();
vmatrix["ASM"]["affected"  ] = make_list("9.2.0-9.2.5","9.3.0-9.3.1","9.4.0-9.4.4");
vmatrix["ASM"]["unaffected"] = make_list("9.4.5-9.4.8","10","11");


if (bigip_is_affected(vmatrix:vmatrix, sol:sol))
{
  set_kb_item(name:'www/0/XSS', value:TRUE);
  if (report_verbosity > 0) security_warning(port:0, extra:bigip_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = bigip_get_tested_modules();
  audit_extra = "For BIG-IP module(s) " + tested + ",";
  if (tested) audit(AUDIT_INST_VER_NOT_VULN, audit_extra, version);
  else audit(AUDIT_HOST_NOT, "running the affected module ASM");
}