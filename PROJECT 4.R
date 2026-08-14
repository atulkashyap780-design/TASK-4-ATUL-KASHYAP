# ============================================
# PROJECT 4: SYSTEM VULNERABILITY CHECKLIST
# ============================================

cat("============================================\n")
cat("     SYSTEM VULNERABILITY CHECKLIST\n")
cat("============================================\n\n")


# ---------- Helper Function ----------
ask_yes_no <- function(question) {

  repeat {

    answer <- tolower(
      trimws(
        readline(
          paste0(question, " (y/n): ")
        )
      )
    )

    if (answer %in% c("y", "yes")) {
      return(TRUE)
    }

    if (answer %in% c("n", "no")) {
      return(FALSE)
    }

    cat("Please enter y for Yes or n for No.\n")
  }
}


# ---------- Status Function ----------
status_text <- function(is_safe) {

  if (is_safe) {
    return("PASS")
  } else {
    return("WARNING")
  }
}


# ============================================
# 1. PASSWORD SECURITY
# ============================================

cat("\n1. PASSWORD SECURITY\n")
cat("--------------------------------------------\n")

cat("Do NOT enter your real password in this program.\n")
cat("This section checks password security practices.\n\n")

weak_passwords <- 0


# Short passwords
if (ask_yes_no(
  "Do you use short passwords (less than 12 characters)?"
)) {
  weak_passwords <- weak_passwords + 1
}


# Password reuse
if (ask_yes_no(
  "Do you reuse the same password on multiple accounts?"
)) {
  weak_passwords <- weak_passwords + 1
}


# Personal information
if (ask_yes_no(
  "Do your passwords contain personal information such as name, birthday, or phone number?"
)) {
  weak_passwords <- weak_passwords + 1
}


# MFA
if (!ask_yes_no(
  "Do you use multi-factor authentication (MFA) on important accounts?"
)) {
  weak_passwords <- weak_passwords + 1
}


password_safe <- weak_passwords == 0


# ============================================
# 2. SOFTWARE UPDATE STATUS
# ============================================

cat("\n2. SOFTWARE UPDATE STATUS\n")
cat("--------------------------------------------\n")

updates_pending <- ask_yes_no(
  "Are there any pending operating-system or important software updates?"
)

auto_updates <- ask_yes_no(
  "Are automatic security updates enabled?"
)

software_safe <- !updates_pending && auto_updates


# ============================================
# 3. UNSAFE USER PRACTICES
# ============================================

cat("\n3. USER SECURITY PRACTICES\n")
cat("--------------------------------------------\n")

unsafe_practices <- 0


# Unknown links
if (ask_yes_no(
  "Do you open links or attachments from unknown or untrusted sources?"
)) {
  unsafe_practices <- unsafe_practices + 1
}


# Untrusted software
if (ask_yes_no(
  "Do you install software from unofficial or untrusted websites?"
)) {
  unsafe_practices <- unsafe_practices + 1
}


# Unlocked computer
if (ask_yes_no(
  "Do you leave your computer unlocked when you are away?"
)) {
  unsafe_practices <- unsafe_practices + 1
}


# Public Wi-Fi
if (ask_yes_no(
  "Do you regularly use public Wi-Fi without appropriate security precautions?"
)) {
  unsafe_practices <- unsafe_practices + 1
}


practices_safe <- unsafe_practices == 0


# ============================================
# 4. BASIC SYSTEM SECURITY
# ============================================

cat("\n4. BASIC SYSTEM CHECKS\n")
cat("--------------------------------------------\n")

firewall_enabled <- ask_yes_no(
  "Is the system firewall enabled?"
)

antivirus_enabled <- ask_yes_no(
  "Is antivirus/endpoint protection enabled and up to date?"
)

basic_system_safe <-
  firewall_enabled && antivirus_enabled


# ============================================
# 5. CALCULATE RISK
# ============================================

warning_count <-
  weak_passwords +
  as.integer(updates_pending) +
  as.integer(!auto_updates) +
  unsafe_practices +
  as.integer(!firewall_enabled) +
  as.integer(!antivirus_enabled)


if (warning_count == 0) {

  risk_level <- "LOW"

} else if (warning_count <= 3) {

  risk_level <- "MEDIUM"

} else {

  risk_level <- "HIGH"
}


# ============================================
# 6. SECURITY REPORT
# ============================================

cat("\n\n============================================\n")
cat("              SECURITY REPORT\n")
cat("============================================\n")

cat(
  sprintf(
    "Password security : %s\n",
    status_text(password_safe)
  )
)

cat(
  sprintf(
    "Software updates  : %s\n",
    status_text(software_safe)
  )
)

cat(
  sprintf(
    "User practices    : %s\n",
    status_text(practices_safe)
  )
)

cat(
  sprintf(
    "Basic system      : %s\n",
    status_text(basic_system_safe)
  )
)

cat("--------------------------------------------\n")

cat(
  sprintf(
    "Total warnings    : %d\n",
    warning_count
  )
)

cat(
  sprintf(
    "Overall risk      : %s\n",
    risk_level
  )
)

cat("============================================\n")


# ============================================
# 7. RECOMMENDATIONS
# ============================================

cat("\nRECOMMENDATIONS\n")
cat("--------------------------------------------\n")


if (!password_safe) {

  cat("- Use long, unique passwords (12+ characters).\n")
  cat("- Avoid reusing passwords between accounts.\n")
  cat("- Avoid using personal information in passwords.\n")
  cat("- Enable MFA on important accounts.\n")
}


if (!software_safe) {

  cat("- Install pending security updates.\n")
  cat("- Enable automatic security updates.\n")
}


if (!practices_safe) {

  cat("- Avoid unknown links and unexpected attachments.\n")
  cat("- Download software only from trusted sources.\n")
  cat("- Lock your computer when leaving it unattended.\n")
  cat("- Use security precautions on public Wi-Fi.\n")
}


if (!basic_system_safe) {

  cat("- Enable the system firewall.\n")
  cat("- Keep antivirus/endpoint protection enabled and updated.\n")
}


if (warning_count == 0) {

  cat(
    "- No checklist warnings were identified.\n"
  )

  cat(
    "- Continue following good security practices.\n"
  )
}


cat("\n============================================\n")
cat("This is an educational security checklist.\n")
cat("It is not a complete vulnerability scanner.\n")
cat("============================================\n")