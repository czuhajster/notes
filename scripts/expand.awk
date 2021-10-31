# Expand question and answers indicators (`;;Q` and `;;A`, respectively) into
# div elements with appropriate attributes.

function expandIndicators(line) {
    if (match(line, "^;;Q$") == 1) {
        print "<div class=\"question\">";
    } else if (match(line, "^;;QE$") == 1) {
        print "</div>";
    } else if (match(line, "^;;A$") == 1) {
        print "<div class=\"answer\">";
    } else if (match(line, "^;;AE$") == 1) {
        print "</div>";
    } else {
        print line;
    }
}

{expandIndicators($0)}
