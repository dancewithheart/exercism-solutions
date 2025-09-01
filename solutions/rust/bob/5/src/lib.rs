pub fn reply(message: &str) -> &str {
    if message.trim().is_empty() {
        "Fine. Be that way!"
    } else if message.trim().ends_with("?")
        && (message.to_uppercase() == message
            && message.find(|c: char| c.is_ascii_alphabetic()).is_some()) {
        "Calm down, I know what I'm doing!"
    } else if message.trim().ends_with("?") {
        "Sure."
    } else if message.to_uppercase() == message
        && message.find(|c: char| c.is_ascii_alphabetic()).is_some() {
        "Whoa, chill out!"
    } else {
        return "Whatever.";
    }
}
