class NoteItemType {
  final String id;
  final String title;
  final String text;

  const NoteItemType(this.id, this.title, this.text);
}

class AppState {
  final List<NoteItemType> notes;
  AppState(this.notes);

  static genInitialState() {
    return AppState([
      const NoteItemType("1", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("2", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("3", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("4", "Datorii1 (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("5", "Datorii2 (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("6", "Datorii3 (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("7", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("8", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("9", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n"),
      const NoteItemType("10", "Datorii (de recuperat)",
          "\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n\n mai2022 | chirie 1503/2 \n mai2022 | mouse 45 \n mai2022 | factura energie 444.14 / 2 \n mai2022| cămătărie 152. 5 \n")
    ]);
  }
}


