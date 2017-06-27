#
# (C) Tenable Network Security, Inc.
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if (description)
{
  script_id(41520);
  script_version ("$Revision: 1.8 $");
  script_cvs_date("$Date: 2012/05/17 11:12:38 $");

  script_cve_id("CVE-2008-4311");

  script_name(english:"SuSE 10 Security Update : hal (ZYPP Patch Number 6036)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote SuSE 10 host is missing a security-related patch."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"The dbus package used a too permissive configuration. Therefore
intended access control for some services was not applied.
(CVE-2008-4311)

The new configuration denies access by default. Some dbus services may
break due to this setting and need an updated configuration as well.

Additionally a bug in hal that allowed users to crash the hal daemon
has been fixed."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://support.novell.com/security/cve/CVE-2008-4311.html"
  );
  script_set_attribute(attribute:"solution", value:"Apply ZYPP patch number 6036.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_cwe_id(16);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:suse:suse_linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/03/03");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/09/24");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2012 Tenable Network Security, Inc.");
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
if (rpm_check(release:"SLED10", sp:2, reference:"hal-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLED10", sp:2, reference:"hal-devel-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLED10", sp:2, reference:"hal-gnome-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLED10", sp:2, cpu:"x86_64", reference:"hal-32bit-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLES10", sp:2, reference:"hal-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLES10", sp:2, reference:"hal-devel-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLES10", sp:2, reference:"hal-gnome-0.5.6-33.41")) flag++;
if (rpm_check(release:"SLES10", sp:2, cpu:"x86_64", reference:"hal-32bit-0.5.6-33.41")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else exit(0, "The host is not affected.");