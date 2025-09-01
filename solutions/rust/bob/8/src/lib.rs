fn is_question(message: &str) -> bool {
  message.trim().ends_with("?")
}

fn is_yell(message: &str) -> bool {
  message.to_uppercase() == message &&
    message.find(|c: char| c.is_ascii_alphabetic()).is_some()
}

pub fn reply(message: &str) -> &str {
    if message.trim().is_empty() {
        "Fine. Be that way!"
    } else if is_question(message) && is_yell(message) {
        "Calm down, I know what I'm doing!"
    } else if is_question(message) {
        "Sure."
    } else if is_yell(message) {
        "Whoa, chill out!"
    } else {
        "Whatever."
    }
}
