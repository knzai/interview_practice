use clap::Parser;

#[allow(unused_imports)]
use interview;

#[derive(Parser, Debug)]
#[clap(version = "0.1", author = "Kenzi Connor")]
pub struct Args {
    #[clap(name = "NAME")]
    pub n: usize,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let args = Args::parse();
    println!("Fibonacci for: {}!", args.n);

    let (mut a,mut b) = (1,0);
    let mut c;

    for _i in 0..args.n {
        c = a + b;
        print!("{} ", c);
        a = b;
        b = c;
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