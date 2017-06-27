#
# (C) Tenable Network Security, Inc.
#
# The descriptive text and package checks in this plugin were  
# extracted from Fedora Security Advisory 2016-e1784417af.
#

include("compat.inc");

if (description)
{
  script_id(89624);
  script_version("$Revision: 1.2 $");
  script_cvs_date("$Date: 2016/10/18 17:03:07 $");

  script_cve_id("CVE-2015-7549", "CVE-2015-8558", "CVE-2015-8567", "CVE-2015-8568", "CVE-2015-8666", "CVE-2015-8743", "CVE-2015-8744", "CVE-2015-8745", "CVE-2016-1570", "CVE-2016-1571");
  script_xref(name:"FEDORA", value:"2016-e1784417af");

  script_name(english:"Fedora 22 : xen-4.5.2-7.fc22 (2016-e1784417af)");
  script_summary(english:"Checks rpm output for the updated package.");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote Fedora host is missing a security update."
  );
  script_set_attribute(
    attribute:"description", 
    value:
"PV superpage functionality missing sanity checks [XSA-167,
CVE-2016-1570] VMX: intercept issue with INVLPG on non-canonical
address [XSA-168, CVE-2016-1571] Qemu: pci: NULL pointer dereference
issue CVE-2015-7549 qemu: DoS by infinite loop in ehci_advance_state
CVE-2015-8558 qemu: Heap-based buffer overrun during VM migration
CVE-2015-8666 Qemu: net: vmxnet3: incorrect l2 header validation leads
to a crash via assert(2) call CVE-2015-8744 qemu: Support reading IMR
registers on bar0 CVE-2015-8745 Qemu: net: vmxnet3: host memory
leakage CVE-2015-8567 CVE-2015-8568 Qemu: net: ne2000: OOB memory
access in ioport r/w functions CVE-2015-8743

Note that Tenable Network Security has extracted the preceding
description block directly from the Fedora security advisory. Tenable
has attempted to automatically clean and format it as much as possible
without introducing additional issues."
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1264929"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1270871"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1270876"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1277983"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1283722"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1289816"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1291137"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1296539"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://bugzilla.redhat.com/show_bug.cgi?id=1296544"
  );
  # https://lists.fedoraproject.org/pipermail/package-announce/2016-February/176503.html
  script_set_attribute(
    attribute:"see_also",
    value:"http://www.nessus.org/u?56568ab5"
  );
  script_set_attribute(attribute:"solution", value:"Update the affected xen package.");
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");
  script_set_cvss3_base_vector("CVSS:3.0/AV:N/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"p-cpe:/a:fedoraproject:fedora:xen");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:fedoraproject:fedora:22");

  script_set_attribute(attribute:"patch_publication_date", value:"2016/02/01");
  script_set_attribute(attribute:"plugin_publication_date", value:"2016/03/04");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2016 Tenable Network Security, Inc.");
  script_family(english:"Fedora Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/RedHat/release", "Host/RedHat/rpm-list");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("rpm.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);
release = get_kb_item("Host/RedHat/release");
if (isnull(release) || "Fedora" >!< release) audit(AUDIT_OS_NOT, "Fedora");
os_ver = eregmatch(pattern: "Fedora.*release ([0-9]+)", string:release);
if (isnull(os_ver)) audit(AUDIT_UNKNOWN_APP_VER, "Fedora");
os_ver = os_ver[1];
if (! ereg(pattern:"^22([^0-9]|$)", string:os_ver)) audit(AUDIT_OS_NOT, "Fedora 22.x", "Fedora " + os_ver);

if (!get_kb_item("Host/RedHat/rpm-list")) audit(AUDIT_PACKAGE_LIST_MISSING);

cpu = get_kb_item("Host/cpu");
if (isnull(cpu)) audit(AUDIT_UNKNOWN_ARCH);
if ("x86_64" >!< cpu && cpu !~ "^i[3-6]86$") audit(AUDIT_LOCAL_CHECKS_NOT_IMPLEMENTED, "Fedora", cpu);

flag = 0;
if (rpm_check(release:"FC22", reference:"xen-4.5.2-7.fc22")) flag++;


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
  else audit(AUDIT_PACKAGE_NOT_INSTALLED, "xen");
}