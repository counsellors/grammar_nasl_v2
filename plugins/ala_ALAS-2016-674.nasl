#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2016-674.
#

include("compat.inc");

if (description)
{
  script_id(90267);
  script_version("$Revision: 2.3 $");
  script_cvs_date("$Date: 2016/10/07 15:17:41 $");

  script_cve_id("CVE-2015-7560");
  script_xref(name:"ALAS", value:"2016-674");

  script_name(english:"Amazon Linux AMI : samba (ALAS-2016-674)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A flaw was found in the way Samba handled ACLs on symbolic links. An
authenticated user could use this flaw to gain access to an arbitrary
file or directory by overwriting its ACL."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2016-674.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"Run 'yum update samba' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:S/C:N/I:P/A:N");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:L/UI:N/S:U/C:N/I:H/A:N");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:ctdb");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:ctdb-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:ctdb-tests");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libsmbclient");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libsmbclient-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libwbclient");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:libwbclient-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-client");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-client-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-common");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-common-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-common-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-pidl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-python");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-test");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-test-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-test-libs");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-winbind");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-winbind-clients");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-winbind-krb5-locator");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:samba-winbind-modules");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/03/29");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/04/01");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
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
if (rpm_check(release:"ALA", reference:"ctdb-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"ctdb-devel-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"ctdb-tests-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libsmbclient-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libsmbclient-devel-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libwbclient-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"libwbclient-devel-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-client-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-client-libs-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-common-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-common-libs-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-common-tools-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-debuginfo-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-devel-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-libs-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-pidl-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-python-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-test-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-test-devel-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-test-libs-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-winbind-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-winbind-clients-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-winbind-krb5-locator-4.2.3-12.31.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"samba-winbind-modules-4.2.3-12.31.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "ctdb / ctdb-devel / ctdb-tests / libsmbclient / libsmbclient-devel / etc");
}