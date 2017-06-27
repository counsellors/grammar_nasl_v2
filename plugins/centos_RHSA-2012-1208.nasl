#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2012:1208 and 
# CentOS Errata and Security Advisory 2012:1208 respectively.
#

include("compat.inc");

if (description)
{
  script_id(61720);
  script_version("$Revision: 1.5 $");
  script_cvs_date("$Date: 2016/05/20 13:54:05 $");

  script_cve_id("CVE-2012-3480");
  script_osvdb_id(84710);
  script_xref(name:"RHSA", value:"2012:1208");

  script_name(english:"CentOS 6 : glibc (CESA-2012:1208)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing one or more security updates."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Updated glibc packages that fix multiple security issues are now
available for Red Hat Enterprise Linux 6.

The Red Hat Security Response Team has rated this update as having
moderate security impact. A Common Vulnerability Scoring System (CVSS)
base score, which gives a detailed severity rating, is available from
the CVE link in the References section.

The glibc packages provide the standard C and standard math libraries
used by multiple programs on the system. Without these libraries, the
Linux system cannot function properly.

Multiple integer overflow flaws, leading to stack-based buffer
overflows, were found in glibc's functions for converting a string to
a numeric representation (strtod(), strtof(), and strtold()). If an
application used such a function on attacker controlled input, it
could cause the application to crash or, potentially, execute
arbitrary code. (CVE-2012-3480)

All users of glibc are advised to upgrade to these updated packages,
which contain a backported patch to correct these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2012-August/018828.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?ed9b00ed"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Update the affected glibc packages."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:POC/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc-headers");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc-static");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:glibc-utils");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:nscd");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");

  script_set_attribute(attribute:"plugin_publication_date", value:"2012/08/30");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2012-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-6", reference:"glibc-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"glibc-common-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"glibc-devel-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"glibc-headers-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"glibc-static-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"glibc-utils-2.12-1.80.el6_3.5")) flag++;
if (rpm_check(release:"CentOS-6", reference:"nscd-2.12-1.80.el6_3.5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");