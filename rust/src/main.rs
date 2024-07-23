use clap::Parser;

#[allow(unused_imports)]
use interview::fizzbuzz;

#[derive(Parser, Debug)]
#[clap(version = "0.1", author = "Kenzi Connor")]
pub struct Args {
    #[clap(name = "NUMBER")]
    pub number: usize,
}


fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args = Args::parse();
    for i in 0..=args.number {
        println!("Fizzbuzz for {} is {}", i, fizzbuzz(i));
    }
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