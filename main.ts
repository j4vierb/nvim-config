
console.log("print hola munco");

function main({ name }: { name: string; }): number {
  return name.length;
}

console.log(main({ name: "hola" }))

