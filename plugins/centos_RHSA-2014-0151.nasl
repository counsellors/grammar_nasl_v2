#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Red Hat Security Advisory RHSA-2014:0151 and 
# CentOS Errata and Security Advisory 2014:0151 respectively.
#

include("compat.inc");

if (description)
{
  script_id(72436);
  script_version("$Revision: 1.3 $");
  script_cvs_date("$Date: 2016/04/28 18:05:38 $");

  script_cve_id("CVE-2010-2252");
  script_osvdb_id(66109);
  script_xref(name:"RHSA", value:"2014:0151");

  script_name(english:"CentOS 6 : wget (CESA-2014:0151)");
  script_summary(english:"Checks rpm output for the updated package");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote CentOS host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"An updated wget package that fixes one security issue and one bug is
now available for Red Hat Enterprise Linux 6.

The Red Hat Security Response Team has rated this update as having Low
security impact. A Common Vulnerability Scoring System (CVSS) base
score, which gives a detailed severity rating, is available from the
CVE link in the References section.

The wget package provides the GNU Wget file retrieval utility for
HTTP, HTTPS, and FTP protocols. Wget provides various useful features,
such as the ability to work in the background while the user is logged
out, recursive retrieval of directories, file name wildcard matching
or updating files in dependency on file timestamp comparison.

It was discovered that wget used a file name provided by the server
when saving a downloaded file. This could cause wget to create a file
with a different name than expected, possibly allowing the server to
execute arbitrary code on the client. (CVE-2010-2252)

Note: With this update, wget always uses the last component of the
original URL as the name for the downloaded file. Previous behavior of
using the server provided name or the last component of the redirected
URL when creating files can be re-enabled by using the
'--trust-server-names' command line option, or by setting
'trust_server_names=on' in the wget start-up file.

This update also fixes the following bugs :

* Prior to this update, the wget package did not recognize HTTPS SSL
certificates with alternative names (subjectAltName) specified in the
certificate as valid. As a consequence, running the wget command
failed with a certificate error. This update fixes wget to recognize
such certificates as valid. (BZ#1060113)

All users of wget are advised to upgrade to this updated package,
which contain backported patches to correct these issues."
  );
  # http://lists.centos.org/pipermail/centos-announce/2014-February/020145.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?0b9d23d7"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected wget package.");
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
  script_set_cvss_temporal_vector("CVSS2#E:F/RL:U/RC:ND");
  script_set_attribute(attribute:"exploitability_ease", value:"Exploits are available");
  script_set_attribute(attribute:"exploit_available", value:"true");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:centos:centos:wget");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:centos:centos:6");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/02/11");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/02/12");
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
if (rpm_check(release:"CentOS-6", reference:"wget-1.12-1.11.el6_5")) flag++;


if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:rpm_report_get());
  else security_warning(0);
  exit(0);
}
else audit(AUDIT_HOST_NOT, "affected");