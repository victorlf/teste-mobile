import 'package:flutter/material.dart';
import 'package:test_solution/data/models/discipline_model.dart';
import 'package:test_solution/presenter/widgets/percent_indicator.dart';
import 'package:intl/intl.dart';

class DisciplinesListItem extends StatelessWidget {
  final Function(DisciplineModel) deleteMethod;
  final DisciplineModel disciplineModel;
  const DisciplinesListItem(this.disciplineModel, this.deleteMethod, {Key? key})
      : super(key: key);

  Widget checkStatus() {
    final percentage = disciplineModel.summary.percentage;
    if (percentage != null) {
      return PercentIndicator(percentage);
    } else {
      return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final listItemHeight = height * 0.2;
    return Container(
      height: listItemHeight,
      margin: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade700,
        borderRadius: BorderRadius.circular(listItemHeight * 0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                disciplineModel.name,
                style: const TextStyle(fontSize: 14.0),
              ),
              Text(
                DateFormat("dd/MM/yyyy").format(
                    DateTime.fromMillisecondsSinceEpoch(
                        disciplineModel.createdAt)),
                style: const TextStyle(fontSize: 12.0),
              ),
              Text(
                disciplineModel.id,
                style: const TextStyle(fontSize: 10.0),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              checkStatus(),
              IconButton(
                onPressed: () => deleteMethod(disciplineModel),
                icon: Icon(
                  Icons.delete,
                  color: Colors.red.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
