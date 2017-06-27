#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from openSUSE Security Update openSUSE-2015-169.
#
# The text description of this plugin is (C) SUSE LLC.
#

include("compat.inc");

if (description)
{
  script_id(81433);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2015/03/11 13:51:32 $");

  script_cve_id("CVE-2015-0255");

  script_name(english:"openSUSE Security Update : xorg-x11-server (openSUSE-2015-169)");
  script_summary(english:"Check for the openSUSE-2015-169 patch");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote openSUSE host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"xorg-x11-server was updated to fix one security issue.

This security issue was fixed :

  - CVE-2015-0255: Information leak in the XkbSetGeometry
    request of X servers (bnc#915810)."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.opensuse.org/show_bug.cgi?id=915810"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected xorg-x11-server packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server-debugsource");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server-extra");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server-extra-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:xorg-x11-server-sdk");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:13.1");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:13.2");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/02/12");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/02/23");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
  script_family(english:"SuSE Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/SuSE/release", "Host/SuSE/rpm-list", "Host/cpu");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/SuSE/release");
if (isnull(release) || release =~ "^(SLED|SLES)") audit(AUDIT_OS_NOT, "openSUSE");
if (release !~ "^(SUSE13\.1|SUSE13\.2)$") audit(AUDIT_OS_RELEASE_NOT, "openSUSE", "13.1 / 13.2", release);
if (!get_kb_item("Host/SuSE/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

ourarch = get_kb_item("Host/cpu");
if (!ourarch) audit(AUDIT_UNKNOWN_ARCH);
if (ourarch !~ "^(i586|i686|x86_64)$") audit(AUDIT_ARCH_NOT, "i586 / i686 / x86_64", ourarch);

flag = 0;

if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-debuginfo-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-debugsource-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-extra-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-extra-debuginfo-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.1", reference:"xorg-x11-server-sdk-7.6_1.14.3.901-16.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-7.6_1.16.1-9.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-debuginfo-7.6_1.16.1-9.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-debugsource-7.6_1.16.1-9.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-extra-7.6_1.16.1-9.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-extra-debuginfo-7.6_1.16.1-9.1") ) flag++;
if ( rpm_check(release:"SUSE13.2", reference:"xorg-x11-server-sdk-7.6_1.16.1-9.1") ) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else
{
  tested = pkg_tests_get();
  if (tested) audit(AUDIT_PACKAGE_NOT_AFFECTED, tested);
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "xorg-x11-server / xorg-x11-server-debuginfo / etc");
}