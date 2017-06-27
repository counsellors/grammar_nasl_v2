#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were
# extracted from Amazon Linux AMI Security Advisory ALAS-2016-702.
#

include("compat.inc");

if (description)
{
  script_id(91240);
  script_version("$Revision: 2.3 $");
  script_cvs_date("$Date: 2016/10/07 15:17:41 $");

  script_cve_id("CVE-2016-1978", "CVE-2016-1979");
  script_xref(name:"ALAS", value:"2016-702");

  script_name(english:"Amazon Linux AMI : nspr / nss-util,nss,nss-softokn (ALAS-2016-702)");
  script_summary(english:"Checks rpm output for the updated packages");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Amazon Linux AMI host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"A use-after-free flaw was found in the way NSS handled DHE
(DiffieHellman key exchange) and ECDHE (Elliptic Curve Diffie-Hellman
key exchange) handshake messages. A remote attacker could send a
specially crafted handshake message that, when parsed by an
application linked against NSS, would cause that application to crash
or, under certain special conditions, execute arbitrary code using the
permissions of the user running the application. (CVE-2016-1978)

A use-after-free flaw was found in the way NSS processed certain DER
(Distinguished Encoding Rules) encoded cryptographic keys. An attacker
could use this flaw to create a specially crafted DER encoded
certificate which, when parsed by an application compiled against the
NSS library, could cause that application to crash, or execute
arbitrary code using the permissions of the user running the
application. (CVE-2016-1979)"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://alas.aws.amazon.com/ALAS-2016-702.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:
"Run 'yum update nspr' to update your system.

Run 'yum update nss-util' to update your system.

Run 'yum update nss' to update your system.

Run 'yum update nss-softokn' to update your system."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:L/PR:N/UI:R/S:U/C:H/I:H/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nspr");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nspr-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nspr-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-pkcs11-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-softokn");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-softokn-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-softokn-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-softokn-freebl");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-softokn-freebl-devel");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-sysinit");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-tools");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-util");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-util-debuginfo");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:amazon:linux:nss-util-devel");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:amazon:linux");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/05/18");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/05/19");
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
if (rpm_check(release:"ALA", reference:"nspr-4.11.0-1.37.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nspr-debuginfo-4.11.0-1.37.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nspr-devel-4.11.0-1.37.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-debuginfo-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-devel-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-pkcs11-devel-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-softokn-3.16.2.3-14.2.38.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-softokn-debuginfo-3.16.2.3-14.2.38.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-softokn-devel-3.16.2.3-14.2.38.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-softokn-freebl-3.16.2.3-14.2.38.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-softokn-freebl-devel-3.16.2.3-14.2.38.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-sysinit-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-tools-3.21.0-9.76.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-util-3.21.0-2.2.50.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-util-debuginfo-3.21.0-2.2.50.amzn1")) flag++;
if (rpm_check(release:"ALA", reference:"nss-util-devel-3.21.0-2.2.50.amzn1")) flag++;

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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "nspr / nspr-debuginfo / nspr-devel / nss / nss-debuginfo / etc");
}