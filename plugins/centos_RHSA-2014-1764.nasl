#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2014:1764 and 
# CentOS Errata and Security Advisory 2014:1764 respectively.
#

include("compat.inc");

if (description)
{
  script_id(78751);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2016/05/04 14:39:53 $");

  script_cve_id("CVE-2014-4877");
  script_bugtraq_id(70751);
  script_osvdb_id(113736);
  script_xref(name:"RHSA", value:"2014:1764");

  script_name(english:"CentOS 6 / 7 : wget (CESA-2014:1764)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An updated wget package that fixes one security issue is now available
for Red Hat Enterprise Linux 6 and 7.

Red Hat Product Security has rated this update as having Moderate
security impact. A Common Vulnerability Scoring System (CVSS) base
score, which gives a detailed severity rating, is available from the
CVE link in the References section.

The wget package provides the GNU Wget file retrieval utility for
HTTP, HTTPS, and FTP protocols.

A flaw was found in the way Wget handled symbolic links. A malicious
FTP server could allow Wget running in the mirror mode (using the '-m'
command line option) to write an arbitrary file to a location writable
to by the user running Wget, possibly leading to code execution.
(CVE-2014-4877)

Note: This update changes the default value of the --retr-symlinks
option. The file symbolic links are now traversed by default and
pointed-to files are retrieved rather than creating a symbolic link
locally.

Red Hat would like to thank the GNU Wget project for reporting this
issue. Upstream acknowledges HD Moore of Rapid7, Inc as the original
reporter.

All users of wget are advised to upgrade to this updated package,
which contains a backported patch to correct this issue."
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-October/020720.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?c4172f51"
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-October/020721.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?e54cac9b"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected wget package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:OF/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:wget");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:7");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/10/30");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/10/31");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"CentOS-6", reference:"wget-1.12-5.el6_6.1")) flag++;

if (rpm_check(release:"CentOS-7", cpu:"x86_64", reference:"wget-1.14-10.el7_0.1")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:rpm_report_get());
  else security_hole(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");