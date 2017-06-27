#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from openSUSE Security Update flash-player-2072.
#
# The text description of this plugin is (C) SUSE LLC.
#

include("compat.inc");

if (description)
{
  script_id(27219);
  script_version ("$Revision: 1.10 $");
  script_cvs_date("$Date: 2014/06/13 20:06:06 $");

  script_cve_id("CVE-2006-3311", "CVE-2006-3587", "CVE-2006-3588", "CVE-2006-4640");

  script_name(english:"openSUSE 10 Security Update : flash-player (flash-player-2072)");
  script_summary(english:"Check for the flash-player-2072 patch");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote openSUSE host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Multiple input validation errors have been identified in Flash Player
that could lead to the potential execution of arbitrary code. These
vulnerabilities could be accessed through content delivered from a
remote location via the user's web browser, email client, or other
applications that include or reference the Flash Player.
(CVE-2006-3311, CVE-2006-3587, CVE-2006-3588)

These updates include changes to prevent circumvention of the
'allowScriptAccess' option. (CVE-2006-4640)"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected flash-player package."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_cwe_id(264);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:novell:opensuse:flash-player");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:novell:opensuse:10.1");

  script_set_attribute(attribute:"patch_publication_date", value:"2006/09/13");
  script_set_attribute(attribute:"plugin_publication_date", value:"2007/10/17");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2007-2014 Tenable Network Security, Inc.");
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
if (release !~ "^(SUSE10\.1)$") audit(AUDIT_OS_RELEASE_NOT, "openSUSE", "10.1", release);
if (!get_kb_item("Host/SuSE/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

ourarch = get_kb_item("Host/cpu");
if (!ourarch) audit(AUDIT_UNKNOWN_ARCH);
if (ourarch !~ "^(i586|i686)$") audit(AUDIT_ARCH_NOT, "i586 / i686", ourarch);

flag = 0;

if ( rpm_check(release:"SUSE10.1", reference:"flash-player-7.0.68.0-1.2") ) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "flash-player");
}