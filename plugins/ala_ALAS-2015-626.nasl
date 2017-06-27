#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2015-626.
#

include("compat.inc");

if (description)
{
  script_id(87352);
  script_version("$Revision: 2.1 $");
  script_cvs_date("$Date: 2015/12/15 14:50:16 $");

  script_cve_id("CVE-2014-8169");
  script_xref(name:"ALAS", value:"2015-626");

  script_name(english:"Amazon Linux AMI : autofs (ALAS-2015-626)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"It was found that program-based automounter maps that used interpreted
languages such as Python would use standard environment variables to
locate and load modules of those languages. A local attacker could
potentially use this flaw to escalate their privileges on the system."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2015-626.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update autofs' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:autofs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:autofs-debuginfo");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2015/12/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2015/12/15");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2015 Tenable Network Security, Inc.");
  script_family(english:"Amazon Linux Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/AmazonLinux/release", "Host/AmazonLinux/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");


if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
if (!get_kb_item("Host/AmazonLinux/release")) audit(AUDIT_OS_NOT, "Amazon Linux AMI");
if (!get_kb_item("Host/AmazonLinux/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);


flag = 0;
if (rpm_check(release:"ALA", reference:"autofs-5.0.7-54.22.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"autofs-debuginfo-5.0.7-54.22.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "autofs / autofs-debuginfo");
}