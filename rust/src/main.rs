use clap::Parser;

#[allow(unused_imports)]
use interview;

#[derive(Parser, Debug)]
#[clap(version = "0.1", author = "Kenzi Connor")]
pub struct Args {
    #[clap(name = "NAME")]
    pub name: String,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args = Args::parse();
    println!("Hello, {}!", args.name);    
    Ok(())
}

#[cfg(test)]
mod tests {
    use crate::main;

#[test]
    fn main_passes() {
        assert_eq!(main().unwrap(), ());
    }
}