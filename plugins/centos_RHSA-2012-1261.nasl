#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2012:1261 and 
# CentOS Errata and Security Advisory 2012:1261 respectively.
#

include("compat.inc");

if (description)
{
  script_id(62082);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2015/01/26 14:44:38 $");

  script_cve_id("CVE-2012-3524");
  script_bugtraq_id(55517);
  script_xref(name:"RHSA", value:"2012:1261");

  script_name(english:"CentOS 6 : dbus (CESA-2012:1261)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated dbus packages that fix one security issue are now available
for Red Hat Enterprise Linux 6.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

D-Bus is a system for sending messages between applications. It is
used for the system-wide message bus service and as a
per-user-login-session messaging facility.

It was discovered that the D-Bus library honored environment settings
even when running with elevated privileges. A local attacker could
possibly use this flaw to escalate their privileges, by setting
specific environment variables before running a setuid or setgid
application linked against the D-Bus library (libdbus).
(CVE-2012-3524)

Note: With this update, libdbus ignores environment variables when
used by setuid or setgid applications. The environment is not ignored
when an application gains privileges via file system capabilities;
however, no application shipped in Red Hat Enterprise Linux 6 gains
privileges via file system capabilities.

Red Hat would like to thank Sebastian Krahmer of the SUSE Security
Team for reporting this issue.

All users are advised to upgrade to these updated packages, which
contain a backported patch to correct this issue. For the update to
take effect, all running instances of dbus-daemon and all running
applications using the libdbus library must be restarted, or the
system rebooted."
  );
  # http://lists.centos.org/pipermail/centos-announce/2012-September/018872.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?0ea76c8d"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected dbus packages.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:C");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");
  script_set_attribute(attribute:"exploit_framework_core", value:"true");
  script_set_attribute(attribute:"exploited_by_malware", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:dbus");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:dbus-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:dbus-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:dbus-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:dbus-x11");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");

  script_set_attribute(attribute:"plugin_publication_date", value:"2012/09/14");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2015 Tenable Network Security, Inc.");
  script_family(english:"CentOS Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/CentOS/release", "Host/CentOS/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/CentOS/release")) audit(AUDIT_OS_NOT, "CentOS");
if (!get_kb_item("Host/CentOS/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "CentOS", cpu);


flag = 0;
if (rpm_check(release:"CentOS-6", reference:"dbus-1.2.24-7.el6_3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"dbus-devel-1.2.24-7.el6_3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"dbus-doc-1.2.24-7.el6_3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"dbus-libs-1.2.24-7.el6_3")) flag++;
if (rpm_check(release:"CentOS-6", reference:"dbus-x11-1.2.24-7.el6_3")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");