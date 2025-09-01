pub fn reply(message: &str) -> &str {
    if message.trim().is_empty() {
        return "Fine. Be that way!";
    } else if message.trim().ends_with("?")
        && (message.to_uppercase() == message
            && message.find(|c: char| c.is_ascii_alphabetic()).is_some()) {
        return "Calm down, I know what I'm doing!";
    } else if message.trim().ends_with("?") {
        return "Sure.";
    } else if message.to_uppercase() == message
        && message.find(|c: char| c.is_ascii_alphabetic()).is_some() {
        return "Whoa, chill out!";
    } else {
        return "Whatever.";
    }
}
