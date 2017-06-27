#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2014-405.
#

include("compat.inc");

if (description)
{
  script_id(78348);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2015/01/30 14:55:42 $");

  script_cve_id("CVE-2013-2064");
  script_xref(name:"ALAS", value:"2014-405");

  script_name(english:"Amazon Linux AMI : libxcb (ALAS-2014-405)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Integer overflow in X.org libxcb 1.9 and earlier allows X servers to
trigger allocation of insufficient memory and a buffer overflow via
vectors related to the read_packet function."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2014-405.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update libxcb' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libxcb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libxcb-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libxcb-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libxcb-doc");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libxcb-python");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2014/09/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2014/10/12");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2014-2015 Tenable Network Security, Inc.");
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
if (rpm_check(release:"ALA", reference:"libxcb-1.8.1-1.15.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libxcb-debuginfo-1.8.1-1.15.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libxcb-devel-1.8.1-1.15.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libxcb-doc-1.8.1-1.15.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libxcb-python-1.8.1-1.15.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "libxcb / libxcb-debuginfo / libxcb-devel / libxcb-doc / etc");
}