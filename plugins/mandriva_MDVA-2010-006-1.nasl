#%NASL_MIN_LEVEL 99999
# @DEPRECATED@
#
# This script has been deprecated as the associated patch is not
# currently a security fix.
#
# Disabled on 2012/09/06.
#

#
# (C) Tenable Network Security, Inc.
#
# This script was automatically generated from
# Mandriva Linux Security Advisory MDVA-2010:006-1.
#

if (!defined_func("bn_random")) exit(0);

include("compat.inc");

if (description)
{
  script_id(44916);
  script_version("$Revision: 1.7 $"); 
  script_cvs_date("$Date: 2012/10/04 19:39:08 $");

  script_name(english:"MDVA-2010:006-1 : timezone");
  script_summary(english:"Checks for patch(es) in 'rpm -qa' output");

  script_set_attribute(attribute:"synopsis", value: 
"The remote Mandriva host is missing one or more security-related
patches.");
  script_set_attribute(attribute:"description", value:
"Updated timezone packages are being provided for older Mandriva Linux
systems that do not contain new Daylight Savings Time information and
Time Zone information for some locations. These updated packages
contain the new information.

Update:

The MDVA-2010:006 advisory did not provide updated timezone packages
for MNF2, CS4 and 2008.0. This advisory provides the missing
packages.

Packages for 2008.0 are provided for Corporate Desktop 2008.0
customers.");
  script_set_attribute(attribute:"see_also", value:"http://www.mandriva.com/security/advisories?name=MDVA-2010:006-1");
  script_set_attribute(attribute:"solution", value:"Update the affected package(s).");
  script_set_attribute(attribute:"risk_factor", value:"High");
  script_set_attribute(attribute:"patch_publication_date", value:"2010/02/25");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:mandriva:linux");
  script_set_attribute(attribute:"plugin_type", value:"local");
 script_set_attribute(attribute:"plugin_publication_date", value: "2010/02/26");
  script_end_attributes();
 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Mandriva Local Security Checks");
 
  script_copyright(english:"This script is Copyright (C) 2010-2011 Tenable Network Security, Inc.");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/Mandrake/release", "Host/Mandrake/rpm-list");

  exit(0);
}

# Deprecated.
exit(0, "The associated patch is not currently a security fix.");


include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) exit(0, "Local checks are not enabled.");
if (!get_kb_item("Host/Mandrake/release")) exit(0, "The host is not running Mandrake Linux.");
if (!get_kb_item("Host/Mandrake/rpm-list")) exit(1, "Could not get the list of packages.");

flag = 0;

if (rpm_check(reference:"timezone-2009u-1.1mdv2008.0", release:"MDK2008.0", cpu:"i386", yank:"mdv")) flag++;
if (rpm_check(reference:"timezone-java-2009u-1.1mdv2008.0", release:"MDK2008.0", cpu:"i386", yank:"mdv")) flag++;

if (rpm_check(reference:"timezone-2009u-1.1mdv2008.0", release:"MDK2008.0", cpu:"x86_64", yank:"mdv")) flag++;
if (rpm_check(reference:"timezone-java-2009u-1.1mdv2008.0", release:"MDK2008.0", cpu:"x86_64", yank:"mdv")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else 
{
  exit(0, "The host is not affected.");
}