#
# (C) Tenable Network Security, Inc.
#
# The descriptive text in this plugin was
# extracted from the Oracle SunOS Patch Updates.
#
include("compat.inc");

if (description)
{
  script_id(13372);
  script_version("$Revision: 1.31 $");
  script_cvs_date("$Date: 2014/08/30 00:33:49 $");

  script_cve_id("CVE-2007-0503");

  script_name(english:"Solaris 8 (sparc) : 111400-04");
  script_summary(english:"Check for patch 111400-04");

  script_set_attribute(
    attribute:"synopsis", 
    value:"The remote host is missing Sun Security Patch number 111400-04"
  );
  script_set_attribute(
    attribute:"description", 
    value:
"SunOS 5.8: kcms_server and kcms_configure patch.
Date this patch was last updated by Sun : Jan/17/07"
  );
  script_set_attribute(
    attribute:"see_also",
    value:"http://download.oracle.com/sunalerts/1000085.1.html"
  );
  script_set_attribute(
    attribute:"solution", 
    value:"You should install this patch for your system to be up-to-date."
  );
  script_set_cvss_base_vector("CVSS2#AV:L/AC:M/Au:N/C:C/I:C/A:C");

  script_set_attribute(attribute:"plugin_type", value:"local");
  script_set_attribute(attribute:"cpe", value:"cpe:/o:sun:solaris");

  script_set_attribute(attribute:"patch_publication_date", value:"2007/01/17");
  script_set_attribute(attribute:"plugin_publication_date", value:"2004/07/12");
  script_end_attributes();

  script_category(ACT_GATHER_INFO);
  script_copyright(english:"This script is Copyright (C) 2004-2014 Tenable Network Security, Inc.");
  script_family(english:"Solaris Local Security Checks");

  script_dependencies("ssh_get_info.nasl");
  script_require_keys("Host/local_checks_enabled", "Host/Solaris/showrev");

  exit(0);
}


include("audit.inc");
include("global_settings.inc");
include("solaris.inc");

if (!get_kb_item("Host/local_checks_enabled")) audit(AUDIT_LOCAL_CHECKS_NOT_ENABLED);

if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"111400-04", obsoleted_by:"", package:"SUNWkcspg", version:"1.1.2,REV=1.7") < 0) flag++;
if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"111400-04", obsoleted_by:"", package:"SUNWkcsrt", version:"1.1.2,REV=1.7") < 0) flag++;
if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"111400-04", obsoleted_by:"", package:"SUNWkcspx", version:"1.1.2,REV=1.7") < 0) flag++;
if (solaris_check_patch(release:"5.8", arch:"sparc", patch:"111400-04", obsoleted_by:"", package:"SUNWkcsrx", version:"1.1.2,REV=1.7") < 0) flag++;

if (flag)
{
  if (report_verbosity > 0) security_warning(port:0, extra:solaris_get_report());
  else security_warning(0);
  exit(0);
}
audit(AUDIT_HOST_NOT, "affected");