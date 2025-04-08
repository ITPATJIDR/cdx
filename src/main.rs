use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();
    
    if args.len() != 2 {
        eprintln!("Usage: cdx <--");
        eprintln!("Example: cdx <-- (to go up two directories)");
        std::process::exit(1);
    }

    let pattern = &args[1];
    
    if !pattern.starts_with('<') || !pattern[1..].chars().all(|c| c == '-') {
        eprintln!("Invalid pattern. Use format: <, <-, <--, <---, etc.");
        eprintln!("Example: cdx <-- (to go up two directories)");
        std::process::exit(1);
    }

    let levels = pattern.chars().filter(|&c| c == '-').count();
    
    print!("{}", "../".repeat(levels));
}