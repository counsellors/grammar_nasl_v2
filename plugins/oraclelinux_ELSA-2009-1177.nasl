#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Red Hat Security Advisory RHSA-2009:1177 and 
# Oracle Linux Security Advisory ELSA-2009-1177 respectively.
#

include("compat.inc");

if (description)
{
  script_id(67897);
  script_version("$Revision: 1.7 $");
  script_cvs_date("$Date: 2016/12/07 20:57:50 $");

  script_cve_id("CVE-2008-1679", "CVE-2008-1721", "CVE-2008-1887", "CVE-2008-2315", "CVE-2008-3142", "CVE-2008-3143", "CVE-2008-3144", "CVE-2008-4864", "CVE-2008-5031");
  script_bugtraq_id(28715, 28749, 30491, 31932, 31976, 33187);
  script_osvdb_id(47478, 50097);
  script_xref(name:"RHSA", value:"2009:1177");

  script_name(english:"Oracle Linux 4 : python (ELSA-2009-1177)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Oracle Linux host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"From Red Hat Security Advisory 2009:1177 :

Updated python packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 4.

This update has been rated as having moderate security impact by the
Red Hat Security Response Team.

Python is an interpreted, interactive, object-oriented programming
language.

When the assert() system call was disabled, an input sanitization flaw
was revealed in the Python string object implementation that led to a
buffer overflow. The missing check for negative size values meant the
Python memory allocator could allocate less memory than expected. This
could result in arbitrary code execution with the Python interpreter's
privileges. (CVE-2008-1887)

Multiple buffer and integer overflow flaws were found in the Python
Unicode string processing and in the Python Unicode and string object
implementations. An attacker could use these flaws to cause a denial
of service (Python application crash). (CVE-2008-3142, CVE-2008-5031)

Multiple integer overflow flaws were found in the Python imageop
module. If a Python application used the imageop module to process
untrusted images, it could cause the application to crash or,
potentially, execute arbitrary code with the Python interpreter's
privileges. (CVE-2008-1679, CVE-2008-4864)

Multiple integer underflow and overflow flaws were found in the Python
snprintf() wrapper implementation. An attacker could use these flaws
to cause a denial of service (memory corruption). (CVE-2008-3144)

Multiple integer overflow flaws were found in various Python modules.
An attacker could use these flaws to cause a denial of service (Python
application crash). (CVE-2008-2315, CVE-2008-3143)

An integer signedness error, leading to a buffer overflow, was found
in the Python zlib extension module. If a Python application requested
the negative byte count be flushed for a decompression stream, it
could cause the application to crash or, potentially, execute
arbitrary code with the Python interpreter's privileges.
(CVE-2008-1721)

Red Hat would like to thank David Remahl of the Apple Product Security
team for responsibly reporting the CVE-2008-1679 and CVE-2008-2315
issues.

All Python users should upgrade to these updated packages, which
contain backported patches to correct these issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://oss.oracle.com/pipermail/el-errata/2009-July/001091.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected python packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:ND/RL:ND/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"No known exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"false");
  script_cwe_id(119, 189);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:python");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:python-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:python-docs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:python-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:oracle:linux:tkinter");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:oracle:linux:4");

  script_set_attribute(attribute:"patch_publication_date", value:"2009/07/27");
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
if (! ereg(pattern:"^4([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Oracle Linux 4", "Oracle Linux " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && "ia64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Oracle Linux", cpu);

flag = 0;
if (rpm_check(release:"EL4", reference:"python-2.3.4-14.7.el4_8.2")) flag++;
if (rpm_check(release:"EL4", reference:"python-devel-2.3.4-14.7.el4_8.2")) flag++;
if (rpm_check(release:"EL4", reference:"python-docs-2.3.4-14.7.el4_8.2")) flag++;
if (rpm_check(release:"EL4", reference:"python-tools-2.3.4-14.7.el4_8.2")) flag++;
if (rpm_check(release:"EL4", reference:"tkinter-2.3.4-14.7.el4_8.2")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "python / python-devel / python-docs / python-tools / tkinter");
}