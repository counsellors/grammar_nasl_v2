#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if (description)
{
  script_id(29468);
  script_version ("$Revision: 1.9 $");
  script_cvs_date("$Date: 2012/05/17 11:12:38 $");

  script_cve_id("CVE-2006-4790");

  script_name(english:"SuSE 10 Security Update : IBM Java (ZYPP Patch Number 2461)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote SuSE 10 host is missing a security-related patch."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"This update brings IBM Java 1.4.2 to Service Release 7.

It contains several undisclosed security fixes, including the fix for
the RSA attack similar to Mitre CVE ID CVE-2006-4790.

It also contains timezone updates :

  - US daylightsaving time update starting 2007.

  - Western Australia daylight savings time introduction in
    December 2006.

  - Update to current timezone dataset."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://support.novell.com/security/cve/CVE-2006-4790.html"
  );
  script_set_attribute(attribute:"solution", value:"Apply ZYPP patch number 2461.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:suse:suse_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/01/12");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/12/13");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2012 Tenable Network Security, Inc.");
  script_family(english:"SuSE Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/cpu", "Host/SuSE/release", "Host/SuSE/rpm-list");

  exit(0);
}


include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) exit(0, "Local checks are not enabled.");
if (!get_kb_item("Host/SuSE/release")) exit(0, "The host is not running SuSE.");
if (!get_kb_item("Host/SuSE/rpm-list")) exit(1, "Could not obtain the list of installed packages.");

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) exit(1, "Failed to determine the architecture type.");
if (cpu >!< "x86_64" && cpu !~ "^i[3-6]86$") exit(1, "Local checks for SuSE 10 on the '"+cpu+"' architecture have not been implemented.");


flag = 0;
if (rpm_check(release:"SLES10", sp:0, reference:"java-1_4_2-ibm-1.4.2.s4-23.10")) flag++;
if (rpm_check(release:"SLES10", sp:0, reference:"java-1_4_2-ibm-devel-1.4.2.s4-23.10")) flag++;
if (rpm_check(release:"SLES10", sp:0, cpu:"i586", reference:"java-1_4_2-ibm-jdbc-1.4.2.s4-23.10")) flag++;
if (rpm_check(release:"SLES10", sp:0, cpu:"i586", reference:"java-1_4_2-ibm-plugin-1.4.2.s4-23.10")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else exit(0, "The host is not affected.");