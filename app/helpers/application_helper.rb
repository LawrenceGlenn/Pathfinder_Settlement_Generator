module ApplicationHelper



  def get_qualities_checkboxes
    tooltips = {
      Academic: {description: 'The settlement possesses a school, training facility, or university of great renown.

        Increaese Lore +1. Increase spellcasting by 1 level.', extra: false},
      Adventure_Site: {description: 'Proximity to a famous adventuring location has long drawn curious adventures from across the land.

        Increase Society +2. Increase purchase limit by 50%.', extra: false},

      Artifact_Gatherer: {description: 'The sale of a certain kind of rare item is heavily restricted. This may be items of a magical, technological, or psychic origin.

        Increase Economy +2. Reduce base value by 50%, purchase of such items is limited to black markets.', extra: false},

      Broad_Minded: {description: 'The citizens are open, friendly, and tolerant, and react positively towards visitors.

        Increase Lore +1, Society +1.', extra: false},

      Cultured: {description: 'The settlement is well known for its culture of artistry, particularly among actors and musicians.

        Increase Society +1. Decrease Law -1. Always counts as a prosperous city for the purpose of perform checks.', extra: false},

      Darkvision: {description: 'Most of the citizens have darkvision, and thus nights provide no cover for thieves and other criminals.Merchants lose little inventory to dishonesty.

        Increase Economy +1. Decrease Crime -1.', extra: false},

      Deep_Traditions: {description: 'The settlement is bolstered by it’s strong traditions, but it’s citizens have difficulty interacting with visitors.

        Increase Law +2. Decrease Crime -2, Society -2.', extra: false},

      Defiant: {description: 'The citizends of this settlement have a natural predilection for free thinking that borders on rebellious action.

        Increase Society +1. Decrease Law -1.', extra: false},

      Holy_Site: {description: 'The settlement hosts a shrine, temple, or landmark with great significance to one or more religions. The settlement has a higher percentage of divine spellcasters in its population.

        Corruption –2; increase spellcasting by 2 levels', extra: false},

      Insular: {description: 'The settlement is isolated, perhaps physically or even spiritually. Its citizens are fiercely loyal to one another.
        
        Law +1; Crime –1', extra: false},

      Long_Memory: {description: 'The people of this settlement have a deep-seated hatred for a specific group or faction.
        
        Any such individual who makes their presence known in town is attacked within 1d4 hours, and either violently out of the settlement or executed. Similarly, residents look upon those who deal with this enemy faction with suspicion, and they must pay 200% the normal price for goods and services and may face mockery, insult, or even violence.', extra: true},

      Magically_Attuned: {description: 'The settlement is a haven for spellcasters due to its location; for example, it may lie at the convergence of multiple ley lines or near a well-known magical site.
        
        Increase base value by 20%; increase purchase limit by 20%; increase spellcasting by 2 levels', extra: false},

      Militarized: {description: 'The populace is devoted to the armed forces. Civil and military law is intertwined, punishments are harsh, and loyalty to the state is expected.

        Increase Law +4. Decrease Society -4.', extra: false},

      Mythic_Sanctum: {description: 'The settlement is a seat of power for one or more living mythic characters, granting each of the mythic characters additional influence so long as they reside here.

        Decrease Corruption -2. Increase each resident mythic character’s effective mythic tier for the purpose of granting spells to followers.', extra: false},

      No_Questions_Asked: {description: 'The citizens mind their own business and respect a visitor’s privacy.

        Increase Society +1. Decrease Lore -1.', extra: false},

      Notorious: {description: 'The settlement has a reputation (deserved or not) for being a den of iniquity. Thieves, rogues, and cutthroats are much more common here.

        Increase Crime +1 and Danger +10; Decrease Law –1; Increase Base Value by 30% and Purchase Limit by 50%', extra: false},

      Pious: {description: 'The settlement is known for its inhabitants’ good manners, friendly spirit, and deep devotion to a deity (this deity must be of the same alignment as the community).

        Increase spellcasting by 1 level; any faith more than one alignment step different than the community’s official religion is at best unwelcome and at worst outlawed—obvious worshipers of an outlawed deity must pay 150% of the normal price for goods and services and may face mockery, insult, or even violence', extra: true},

      Prosperous: {description: 'The settlement is a popular hub for trade. Merchants are wealthy and the citizens live well.

        Increase Economy +1; Increase Base Value by 30%; Increase Purchase Limit by 50%.', extra: false},

      Racially_Intolerant: {description: 'The community is prejudiced against one or more races, which are listed in parentheses.

        Members of the unwelcome race or races must pay 150% of the normal price for goods and services and may face mockery, insult, or even violence', extra: true},

      Resource_Surplus: {description: 'A surplus of a certain community has made for very competitive markets in those kinds of goods.
        
        This commodity and items primarily made from it can be purchased for as little as half the normal cost. The additional cost of making an item with alchemical compounds related to that resource (for instance, alchemical silver for silver or cold iron for iron) is halved in this settlement’s marketplaces.', extra: true},

      Restrictive: {description: 'Foreigners who settle in this settlement are prohibited from owning property in certain districts and sometimes pay a higher price for goods. This disdain rarely involves violence towards foreigners, though the city guard monitors strangers to ensure they don’t cross the boundaries of the city without appropriate paperwork.

        Decrease Corruption -1, Lore -1.', extra: false},

      Rule_of_Might: {description: 'The settlement has a tradition of rule by the strongest individual.

        Increase Law +2; Decrease Society –2.', extra: false},

      Rumormongering_Citizens: {description: 'The settlement’s citizens are nosy and gossipy to a fault—very little happens in the settlement that no one knows about.

        Increase Lore +1; Decrease Society –1.', extra: false},

      Strategic_Location: {description: 'The settlement sits at an important crossroads or alongside a deepwater port, or it serves as a barrier to a pass or bridge.
        
        Economy +1; increase base value by 10%', extra: false},

      Subterranean: {description: 'The settlement is primarily built underground, sheltering it from enemies but also isolating it culturally.

        Increase Law +1; Decrease Lore -1, Danger -5.', extra: false},

      Superstitious: {description: 'The community has a deep and abiding fear of magic and the unexplained, but this fear has caused its citizens to become more supportive and loyal to each other and their settlement.

        Increase Law and Society +2; Decrease Crime –4; reduce spellcasting by 2 levels.', extra: false},

      Supportive: {description: 'The settlement provides aid to its citizens. A number of programs provide food and shelter to he less fortunate. Everyone in the settlement is guaranteed at least two meals a day and a place to sleep with a roof over their head.

        Increase Society +2.', extra: false},

      Timid_Citizens: {description: 'Citizens are quiet and keep to themselves. Crimes often go unreported.

        Increase Crime+2. Decrease Lore -2.', extra: false},

      Tourist_Attraction: {description: 'The settlement possesses some sort of landmark or event that draws visitors from far and wide.

        Increase Economy +1; Increase Base Value by 20%.', extra: false},

      Wealth_Disparity: {description: 'The wealthy and poor of this settlement are segregated.

      High wealth districts gain +2 lore but-2 society. Low wealtch areas gain +2 society but -2 lore. Some ares may be unchanged. The entire settlement gains +2 corruption.', extra: false}
    }
  end

  def get_disadvantages_checkboxes
    tooltips = {
      Anarchy: {description: 'The settlement has no leaders—this type of community is often short-lived and dangerous.
        Replaces settlement’s Government and removes Government adjustments to modifiers; Corruption and Crime +4; Economy and Society –4; Law –6; Danger +20', extra: false},

      Cursed: {description: 'Some form of curse afflicts the city. Its citizens might be prone to violence or suffer ill luck, or they could be plagued by an infestation of pests.
        Choose one modifier and reduce its value by 4', extra: false},

      Heavily_Taxed: {description: 'The settlement is very heavily taxed and has fewer resources available than a settlement of its size normally has.

        Decrease Society -2, base value by 10%, purchase limit by 50%, spellcasting -2. Available magic items as per settlement 1 category smaller.', extra: false},

      Hunted: {description: 'A powerful group or monster uses the city as its hunting ground. Citizens live in fear and avoid going out on the streets unless necessary.
      Economy, Law, and Society –4; Danger +20; reduce base value by 20%', extra: false},
      
      Impoverished: {description: 'Because of any number of factors, the settlement is destitute. Poverty, famine, and disease run rampant.
        Corruption and Crime +1; decrease base value and purchase limit by 50%; halve magic item availability', extra: false},

      Martial_Law: {description: 'As long as the settlement remains under martial law, a 9:00 PM to 6:00 AM curfew is in effect. Additionally, as long as the citizens must follow the edicts and proclamations, the city stifles and suffers.

        Increase Law +2. Decrease Corruption-4, Crime -2 , Economy -4. Danger +10. Halve all values for marketplace entries.', extra: false},

      Oppressed: {description: 'The leadership of this settlement retains oppressive control.

        Decrease Lore -6, Society -6.', extra: false},

      Plagued: {description: 'The community is suffering from a protracted contagion or malady.
        –2 to all modifiers; reduce base value by 20%; select A communicable disease—there’s a 5% chance each day that a PC is exposed to the disease and must make a Fortitude save to avoid contracting the illness', extra: false}
    }
  end

  def get_qualities_title
    'Settlements often have unusual qualities that make them unique. Listed below are several different qualities that can further modify a community’s statistics. A settlement’s type determines how many qualities it can have—once a quality is chosen, it cannot be changed.'
  end

  def get_disadvantages_title
    'Just as a settlement can have unusual qualities to enhance its statistics, it can also suffer from disadvantages. There’s no limit to the number of disadvantages a community can suffer, but most do not have disadvantages, since a settlement plagued by disadvantages for too long eventually collapses. A disadvantage can arise as the result of an event or action taken by a powerful or influential NPC or PC. Likewise, by going on a quest or accomplishing A noteworthy deed, a group of heroes can remove a settlement’s disadvantage.'
  end

  def get_pop_table
    '<table class="size_key">
      <tr>
        <th>Settlement Type</th>
        <th>Population Range</th>
        <th>Recomended Max Qualities</th>
      </tr>
      <tr>
        <td>Thorpe</td>
        <td>Fewer than 20</td>
        <td>1</td>
      </tr>
      <tr>
        <td>Hamlet</td>
        <td>21-60</td>
        <td>1</td>
      </tr>
      <tr>
        <td>Village</td>
        <td>61-200</td>
        <td>2</td>
      </tr>
      <tr>
        <td>Small Town</td>
        <td>201-2,000</td>
        <td>2</td>
      </tr>
      <tr>
        <td>Large Town</td>
        <td>2,001-5,000</td>
        <td>3</td>
      </tr>
      <tr>
        <td>Small City</td>
        <td>5,001-10,000</td>
        <td>4</td>
      </tr>
      <tr>
        <td>Large City</td>
        <td>10,001-25,000</td>
        <td>5</td>
      </tr>
      <tr>
        <td>Metropolis</td>
        <td>More than 25,000</td>
        <td>6</td>
      </tr>
    </table>'
  end

end
