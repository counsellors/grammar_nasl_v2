#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(36396);
  script_version("$Revision: 1.6 $");
  script_cvs_date("$Date: 2014/08/30 00:06:19 $");

  script_cve_id("CVE-2008-4117", "CVE-2009-0857");

  script_name(english:"Solaris 10 (sparc) : 138553-12");
  script_summary(english:"Check for patch 138553-12");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 138553-12"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"Sun Management Center 4.0: PRM Patch for Solaris 10.
Date this patch was last updated by Sun : Mar/14/12"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://getupdates.oracle.com/readme/138553-12"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_cvss_base_vector("CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C");
  script_cwe_id(79);

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2012/03/14");
  script_set_attribute(attribute:"plugin_publication_date", value:"2009/04/23");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2009-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"138553-12", obsoleted_by:"", package:"SUNWessrg", version:"4.0,REV=2.8.2007.11.16") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"138553-12", obsoleted_by:"", package:"SUNWescrg", version:"4.0,REV=2.8.2007.11.16") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"138553-12", obsoleted_by:"", package:"SUNWesdrg", version:"4.0,REV=2.8.2007.11.16") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:solaris_get_report());
  else security_hole(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");