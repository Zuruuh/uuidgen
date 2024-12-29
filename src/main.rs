fn main() {
    let uuid = uuid::Uuid::now_v7();
    println!("{}", uuid.as_simple());
}
