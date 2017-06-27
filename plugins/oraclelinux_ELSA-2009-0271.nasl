#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Red Hat Security Advisory RHSA-2009:0271 and 
# Oracle Linux Security Advisory ELSA-2009-0271 respectively.
#

include("compat.inc");

if (description)
{
  script_id(67804);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/05/06 16:53:47 $");

  script_cve_id("CVE-2009-0386", "CVE-2009-0387", "CVE-2009-0397");
  script_bugtraq_id(33405);
  script_osvdb_id(53550);
  script_xref(name:"RHSA", value:"2009:0271");

  script_name(english:"Oracle Linux 5 : gstreamer-plugins-good (ELSA-2009-0271)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"From Red Hat Security Advisory 2009:0271 :

Updated gstreamer-plugins-good packages that fix several security
issues are now available for Red Hat Enterprise Linux 5.

This update has been rated as having important security impact by the
Red Hat Security Response Team.

GStreamer is a streaming media framework, based on graphs of filters
which operate on media data. GStreamer Good Plug-ins is a collection
of well-supported, GStreamer plug-ins of good quality released under
the LGPL license.

Multiple heap buffer overflows and an array indexing error were found
in the GStreamer's QuickTime media file format decoding plugin. An
attacker could create a carefully-crafted QuickTime media .mov file
that would cause an application using GStreamer to crash or,
potentially, execute arbitrary code if played by a victim.
(CVE-2009-0386, CVE-2009-0387, CVE-2009-0397)

All users of gstreamer-plugins-good are advised to upgrade to these
updated packages, which contain backported patches to correct these
issues. After installing the update, all applications using GStreamer
(such as totem or rhythmbox) must be restarted for the changes to take
effect."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2009-February/000882.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected gstreamer-plugins-good packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:ND/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(119);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:gstreamer-plugins-good");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:gstreamer-plugins-good-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:5");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/02/07");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/07/12");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2016 Tenable Network Security, Inc.");
  script_family(english:"Oracle Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/OracleLinux", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/OracleLinux")) audit(AUDIT_OS_NOT, "Oracle Linux");
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || !eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux)", string:release)) audit(AUDIT_OS_NOT, "Oracle Linux");
os_ver = eregmatch(pattern: "Oracle (?:Linux Server|Enterprise Linux) .*release ([0-9]+(\.[0-9]+)?)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Oracle Linux");
os_ver = os_ver[1];
if (! ereg(pattern:"^5([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 5", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);

flag = 0;
if (rpm_check(release:"EL5", reference:"gstreamer-plugins-good-0.10.9-1.el5_3.1")) flag++;
if (rpm_check(release:"EL5", reference:"gstreamer-plugins-good-devel-0.10.9-1.el5_3.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "gstreamer-plugins-good / gstreamer-plugins-good-devel");
}