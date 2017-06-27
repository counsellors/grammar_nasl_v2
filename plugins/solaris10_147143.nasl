#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(71135);
  script_version("$Revision: 1.4 $");
  script_cvs_date("$Date: 2014/08/30 00:06:20 $");

  script_name(english:"Solaris 10 (sparc) : 147143-17");
  script_summary(english:"Check for patch 147143-17");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 147143-17"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"SunOS 5.10: iSCSI patch.
Date this patch was last updated by Sun : Feb/18/13"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"https://getupdates.oracle.com/readme/147143-17"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_attribute(attribute:"risk_factor", value:"High");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2013/02/18");
  script_set_attribute(attribute:"plugin_publication_date", value:"2013/11/29");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2013-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWiscsir", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfcmdb", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfctl", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWiscsiu", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWmpathadmr", version:"11.10.0,REV=2006.06.15.16.36") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfchba", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfcip", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfcp", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWqus", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWcfcl", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWcfclr", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;
if (solaris_check_patch(release:"5.10", arch:"sparc", patch:"147143-17", obsoleted_by:"", package:"SUNWfcsm", version:"11.10.0,REV=2005.01.04.14.31") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_hole(port:0, extra:solaris_get_report());
  else security_hole(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");