use clap::Parser;

//use lists::first::List;

#[derive(Parser, Debug)]
#[clap(version = "0.1", author = "Kenzi Connor")]
pub struct Args {
    #[clap(name = "NAME")]
    pub name: String,
}

fn main() -> Result<(), Box<dyn std::error::Error>> {
    //let list: List = List::Elem(1, Box::new(List::Elem(2, Box::new(List::Empty))));
    //println!("{:?}", list);
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